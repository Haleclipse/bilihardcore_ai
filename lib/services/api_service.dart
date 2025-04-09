import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:crypto/crypto.dart';
import 'package:bilihardcore_ai/models/category.dart';
import 'package:bilihardcore_ai/models/question.dart';
import 'package:bilihardcore_ai/models/user.dart';
import 'package:bilihardcore_ai/utils/ticket_generator.dart';
import 'package:bilihardcore_ai/utils/logger.dart';
import 'package:bilihardcore_ai/utils/exceptions.dart';

class ApiService {
  final Dio _dio;
  String? _accessToken;
  String? _csrf;
  List<Cookie>? _cookies;

  // API配置
  final Map<String, String> _apiConfig = {
    'appkey': '783bbb7264451d82',
    'appsec': '2653583c8873dea268ab9386918b1d65',
    'user_agent': 'Mozilla/5.0 BiliDroid/1.12.0 (bbcallen@gmail.com)',
  };

  ApiService() : _dio = Dio() {
    _dio.options.headers = {
      'User-Agent': _apiConfig['user_agent'],
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Accept-Language': 'zh-CN,zh;q=0.9,en;q=0.8',
      'x-bili-metadata-legal-region': 'CN',
      'x-bili-aurora-eid': '',
      'x-bili-aurora-zone': '',
    };
  }

  void updateToken(String accessToken, String? csrf) {
    _accessToken = accessToken;
    _csrf = csrf;
  }

  void updateCookies(List<Cookie> cookies) {
    _cookies = cookies;

    // 更新Dio的cookie头
    if (_cookies != null && _cookies!.isNotEmpty) {
      final cookieHeader = _cookies!
          .map((cookie) => '${cookie.name}=${cookie.value}')
          .join('; ');

      _dio.options.headers['Cookie'] = cookieHeader;
      AppLogger.logger.d('更新Cookie头: $cookieHeader');
    }
  }

  // 为请求参数添加签名
  Map<String, dynamic> _addSignature(Map<String, dynamic> params) {
    params['ts'] = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
    params['appkey'] = _apiConfig['appkey']!;

    // 按键排序
    final sortedParams = Map.fromEntries(
      params.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
    );

    // 构建查询字符串
    final queryString = sortedParams.entries
        .map((e) => '${e.key}=${e.value}')
        .join('&');

    // 计算签名
    final sign =
        md5
            .convert(utf8.encode(queryString + _apiConfig['appsec']!))
            .toString();

    // 添加签名到参数
    sortedParams['sign'] = sign;

    return sortedParams;
  }

  // 获取二维码
  Future<Map<String, dynamic>> getQrCode() async {
    try {
      // 获取ticket
      final ticket = await TicketGenerator.getTicket();
      _dio.options.headers['x-bili-ticket'] = ticket;

      // 根据原项目的实现调整请求方式
      // 在原项目中，这个请求会通过appsign函数对参数进行签名
      final params = _addSignature({'local_id': 0});

      final response = await _dio.post(
        'https://passport.bilibili.com/x/passport-tv-login/qrcode/auth_code',
        data: params, // 使用签名后的参数作为表单数据
        options: Options(contentType: 'application/x-www-form-urlencoded'),
      );

      // 记录响应信息以便调试
      AppLogger.logger.d('QR Code API response: ${response.data}');

      if (response.data['code'] == 0) {
        return response.data['data'] as Map<String, dynamic>;
      } else {
        throw Exception('获取二维码失败: ${response.data['message']}');
      }
    } catch (e) {
      AppLogger.logger.e('获取二维码失败', error: e);
      throw Exception('获取二维码失败: $e');
    }
  }

  // 轮询二维码状态
  Future<Map<String, dynamic>> pollQrCode(String authCode) async {
    try {
      // 根据原项目的实现调整请求方式
      // 在原项目中，这个请求会通过appsign函数对参数进行签名
      final params = _addSignature({'auth_code': authCode, 'local_id': 0});

      final response = await _dio.post(
        'https://passport.bilibili.com/x/passport-tv-login/qrcode/poll',
        data: params, // 使用签名后的参数作为表单数据
        options: Options(contentType: 'application/x-www-form-urlencoded'),
      );

      // 记录响应信息以便调试
      AppLogger.logger.d('QR Code Poll API response: ${response.data}');

      return response.data as Map<String, dynamic>;
    } catch (e) {
      AppLogger.logger.e('轮询二维码状态失败', error: e);
      throw Exception('轮询二维码状态失败: $e');
    }
  }

  // 获取分类
  Future<List<Category>> getCategories() async {
    try {
      if (_accessToken == null) {
        throw Exception('未登录');
      }

      final params = _addSignature({
        'access_key': _accessToken!,
        'csrf': _csrf ?? '',
        'disable_rcmd': '0',
        'mobi_app': 'android',
        'platform': 'android',
        'statistics': '{"appId":1,"platform":3,"version":"8.40.0","abtest":""}',
        'web_location': '333.790',
      });

      final response = await _dio.get(
        'https://api.bilibili.com/x/senior/v1/category',
        queryParameters: params,
      );

      AppLogger.logger.d('Category API response: ${response.data}');

      // 检查是否是41099错误码（可能是答题已完成或账号不满足条件）
      if (response.data['code'] == 41099) {
        AppLogger.logger.i('获取分类返回41099错误码，尝试获取答题结果');

        // 尝试获取答题结果，检查是否已经完成答题
        try {
          final quizResult = await getQuizResult();
          AppLogger.logger.i('成功获取答题结果，说明用户已经完成答题');
          // 返回特殊标记，表示答题已完成
          throw QuizCompletedException(quizResult);
        } catch (e) {
          if (e is QuizCompletedException) {
            // 将异常向上传递，以便处理答题已完成的情况
            rethrow;
          } else {
            // 如果获取答题结果也失败，则可能是账号不满足条件
            AppLogger.logger.e('获取答题结果失败，可能是账号不满足条件', error: e);
            throw Exception('账号不满足答题条件，可能需要Lv6及以上等级');
          }
        }
      }

      if (response.data['code'] == 0) {
        final data = response.data['data'] as Map<String, dynamic>;

        // 如果有stage字段且值为2，表示用户已经选择过分类
        if (data.containsKey('stage') && data['stage'] == 2) {
          AppLogger.logger.i('用户已经选择过分类，直接进入答题阶段');
          // 返回空列表，表示不需要选择分类
          return [];
        }

        if (data.containsKey('categories')) {
          final categoriesData = data['categories'] as List;
          return categoriesData
              .map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          AppLogger.logger.e('分类数据结构不符合预期', error: data);
          throw Exception('分类数据结构不符合预期');
        }
      } else {
        throw Exception('获取分类失败: ${response.data['message']}');
      }
    } catch (e) {
      // 如果是答题已完成异常，则向上传递
      if (e is QuizCompletedException) {
        rethrow;
      }
      throw Exception('获取分类失败: $e');
    }
  }

  // 检查是否需要验证码
  Future<bool> checkCaptcha() async {
    try {
      if (_accessToken == null) {
        throw Exception('未登录');
      }

      // 尝试获取题目，如果返回的code不是0，则可能需要验证码
      final params = _addSignature({
        'access_key': _accessToken!,
        'csrf': _csrf ?? '',
        'disable_rcmd': '0',
        'mobi_app': 'android',
        'platform': 'android',
        'statistics': '{"appId":1,"platform":3,"version":"8.40.0","abtest":""}',
        'web_location': '333.790',
      });

      final response = await _dio.get(
        'https://api.bilibili.com/x/senior/v1/question',
        queryParameters: params,
      );

      // 记录响应信息以便调试
      AppLogger.logger.d('Check Captcha API response: ${response.data}');

      // 如果返回的code不是0，则可能需要验证码
      return response.data['code'] != 0;
    } catch (e) {
      AppLogger.logger.e('检查验证码失败', error: e);
      throw Exception('检查验证码失败: $e');
    }
  }

  // 获取验证码
  Future<Map<String, dynamic>> getCaptcha() async {
    try {
      if (_accessToken == null) {
        throw Exception('未登录');
      }

      final params = _addSignature({
        'access_key': _accessToken!,
        'csrf': _csrf ?? '',
        'disable_rcmd': '0',
        'mobi_app': 'android',
        'platform': 'android',
        'statistics': '{"appId":1,"platform":3,"version":"8.40.0","abtest":""}',
        'web_location': '333.790',
      });

      final response = await _dio.get(
        'https://api.bilibili.com/x/senior/v1/captcha',
        queryParameters: params,
      );

      AppLogger.logger.d('Captcha API response: ${response.data}');

      if (response.data['code'] == 0 && response.data['data'] != null) {
        final data = response.data['data'] as Map<String, dynamic>;
        final imageUrl = data['url'];
        final token = data['token'];

        if (imageUrl == null || token == null) {
          AppLogger.logger.e('验证码数据不完整', error: data);
          throw Exception('验证码数据不完整');
        }

        return {'image_url': imageUrl.toString(), 'token': token.toString()};
      } else {
        final message = response.data['message'] ?? '未知错误';
        throw Exception('获取验证码失败: $message');
      }
    } catch (e) {
      throw Exception('获取验证码失败: $e');
    }
  }

  // 提交验证码
  Future<bool> submitCaptcha(
    String code,
    String token, {
    String ids = '',
  }) async {
    try {
      if (_accessToken == null) {
        throw Exception('未登录');
      }

      // 根据原项目的参数进行调整
      final data = _addSignature({
        'access_key': _accessToken!,
        'bili_code': code,
        'bili_token': token,
        'csrf': _csrf ?? '',
        'disable_rcmd': '0',
        'gt_challenge': '',
        'gt_seccode': '',
        'gt_validate': '',
        'ids': ids, // 可选参数
        'mobi_app': 'android',
        'platform': 'android',
        'statistics': '{"appId":1,"platform":3,"version":"8.40.0","abtest":""}',
        'type': 'bilibili',
      });

      final response = await _dio.post(
        'https://api.bilibili.com/x/senior/v1/captcha/submit',
        data: data,
      );

      return response.data['code'] == 0;
    } catch (e) {
      throw Exception('提交验证码失败: $e');
    }
  }

  // 获取题目
  Future<Question> getQuestion() async {
    try {
      if (_accessToken == null) {
        throw Exception('未登录');
      }

      final params = _addSignature({
        'access_key': _accessToken!,
        'csrf': _csrf ?? '',
        'disable_rcmd': '0',
        'mobi_app': 'android',
        'platform': 'android',
        'statistics': '{"appId":1,"platform":3,"version":"8.40.0","abtest":""}',
        'web_location': '333.790',
      });

      final response = await _dio.get(
        'https://api.bilibili.com/x/senior/v1/question',
        queryParameters: params,
      );

      AppLogger.logger.d('Question API response: ${response.data}');

      if (response.data['code'] == 0 && response.data['data'] != null) {
        final questionData = response.data['data'] as Map<String, dynamic>;

        // 根据提供的JSON结构创建 Question 对象
        if (questionData.containsKey('answers') &&
            questionData['answers'] != null) {
          final answersList = questionData['answers'] as List;
          return Question(
            id: questionData['id'].toString(),
            questionText: questionData['question'] as String,
            answers: answersList.map((e) => e['ans_text'] as String).toList(),
            answerHashes:
                answersList.map((e) => e['ans_hash'].toString()).toList(),
            questionNumber: questionData['question_num'] as int,
            startTime:
                questionData.containsKey('start_time')
                    ? questionData['start_time'] as int
                    : null,
          );
        } else {
          AppLogger.logger.e('题目数据不完整', error: questionData);
          throw Exception('题目数据不完整');
        }
      } else {
        throw Exception('获取题目失败: ${response.data['message']}');
      }
    } catch (e) {
      throw Exception('获取题目失败: $e');
    }
  }

  // 提交答案
  Future<Map<String, dynamic>> submitAnswer(
    String id,
    String ansHash,
    String ansText,
  ) async {
    try {
      if (_accessToken == null) {
        throw Exception('未登录');
      }

      final data = _addSignature({
        'access_key': _accessToken!,
        'csrf': _csrf ?? '',
        'id': id,
        'ans_hash': ansHash,
        'ans_text': ansText,
        'disable_rcmd': '0',
        'mobi_app': 'android',
        'platform': 'android',
        'statistics': '{"appId":1,"platform":3,"version":"8.40.0","abtest":""}',
        'web_location': '333.790',
      });

      final response = await _dio.post(
        'https://api.bilibili.com/x/senior/v1/answer/submit',
        data: data,
      );

      return response.data as Map<String, dynamic>;
    } catch (e) {
      throw Exception('提交答案失败: $e');
    }
  }

  // 获取答题结果
  Future<Map<String, dynamic>> getQuizResult() async {
    try {
      if (_accessToken == null) {
        throw Exception('未登录');
      }

      final params = _addSignature({
        'access_key': _accessToken!,
        'csrf': _csrf ?? '',
        'disable_rcmd': '0',
        'mobi_app': 'android',
        'platform': 'android',
        'statistics': '{"appId":1,"platform":3,"version":"8.40.0","abtest":""}',
        'web_location': '333.790',
      });

      final response = await _dio.get(
        'https://api.bilibili.com/x/senior/v1/answer/result',
        queryParameters: params,
      );

      if (response.data['code'] == 0) {
        return response.data['data'] as Map<String, dynamic>;
      } else {
        throw Exception('获取答题结果失败: ${response.data['message']}');
      }
    } catch (e) {
      throw Exception('获取答题结果失败: $e');
    }
  }
}

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

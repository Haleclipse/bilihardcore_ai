import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:crypto/crypto.dart';
import 'package:bilihardcore_ai/models/category.dart';
import 'package:bilihardcore_ai/models/question.dart';
import 'package:bilihardcore_ai/utils/ticket_generator.dart';

class ApiService {
  final Dio _dio;
  String? _accessToken;
  String? _csrf;
  
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
  
  // 为请求参数添加签名
  Map<String, dynamic> _addSignature(Map<String, dynamic> params) {
    params['ts'] = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
    params['appkey'] = _apiConfig['appkey']!;
    
    // 按键排序
    final sortedParams = Map.fromEntries(params.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key)));
    
    // 构建查询字符串
    final queryString = sortedParams.entries
        .map((e) => '${e.key}=${e.value}')
        .join('&');
    
    // 计算签名
    final sign = md5.convert(utf8.encode(queryString + _apiConfig['appsec']!))
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
      
      final response = await _dio.post(
        'https://passport.bilibili.com/x/passport-tv-login/qrcode/auth_code',
        data: {'local_id': 0},
      );
      
      if (response.data['code'] == 0) {
        return response.data['data'] as Map<String, dynamic>;
      } else {
        throw Exception('获取二维码失败: ${response.data['message']}');
      }
    } catch (e) {
      throw Exception('获取二维码失败: $e');
    }
  }
  
  // 轮询二维码状态
  Future<Map<String, dynamic>> pollQrCode(String authCode) async {
    try {
      final response = await _dio.post(
        'https://passport.bilibili.com/x/passport-tv-login/qrcode/poll',
        data: {
          'auth_code': authCode,
          'local_id': 0,
        },
      );
      
      return response.data as Map<String, dynamic>;
    } catch (e) {
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
      
      if (response.data['code'] == 0) {
        final categoriesData = response.data['data'] as List;
        return categoriesData
            .map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('获取分类失败: ${response.data['message']}');
      }
    } catch (e) {
      throw Exception('获取分类失败: $e');
    }
  }
  
  // 检查是否需要验证码
  Future<bool> checkCaptcha() async {
    try {
      // 这里简化处理，实际上可能需要调用特定API
      return true; // 假设总是需要验证码
    } catch (e) {
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
      
      if (response.data['code'] == 0) {
        return {
          'image_url': response.data['data']['image_url'] as String,
          'token': response.data['data']['token'] as String,
        };
      } else {
        throw Exception('获取验证码失败: ${response.data['message']}');
      }
    } catch (e) {
      throw Exception('获取验证码失败: $e');
    }
  }
  
  // 提交验证码
  Future<bool> submitCaptcha(String code, String token) async {
    try {
      if (_accessToken == null) {
        throw Exception('未登录');
      }
      
      final data = _addSignature({
        'access_key': _accessToken!,
        'bili_code': code,
        'bili_token': token,
        'csrf': _csrf ?? '',
        'disable_rcmd': '0',
        'gt_challenge': '',
        'gt_seccode': '',
        'gt_validate': '',
        'ids': '',
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
      
      if (response.data['code'] == 0) {
        final questionData = response.data['data'] as Map<String, dynamic>;
        
        return Question(
          id: questionData['id'].toString(),
          questionText: questionData['question'] as String,
          answers: (questionData['ans_list'] as List)
              .map((e) => e['ans_text'] as String)
              .toList(),
          questionNumber: questionData['no'] as int,
        );
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
}

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

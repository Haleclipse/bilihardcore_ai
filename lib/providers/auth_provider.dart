import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bilihardcore_ai/models/user.dart';
import 'package:bilihardcore_ai/services/api_service.dart';
import 'package:bilihardcore_ai/utils/logger.dart';

class AuthNotifier extends StateNotifier<User> {
  final ApiService _apiService;

  AuthNotifier(this._apiService) : super(User.empty()) {
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user');

      if (userJson != null) {
        final userMap = jsonDecode(userJson) as Map<String, dynamic>;
        final user = User.fromJson(userMap);

        // 检查token是否过期
        if (!user.isTokenExpired) {
          state = user;
          // 更新API服务的token
          _apiService.updateToken(user.accessToken, user.csrf);
        }
      }
    } catch (e) {
      AppLogger.logger.e('加载用户信息失败', error: e);
    }
  }

  Future<void> _saveUser(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(user.toJson()));
      state = user;
      // 更新API服务的token
      _apiService.updateToken(user.accessToken, user.csrf);
    } catch (e) {
      AppLogger.logger.e('保存用户信息失败', error: e);
      throw Exception('保存用户信息失败: $e');
    }
  }

  Future<Map<String, dynamic>> getQrCode() async {
    try {
      final response = await _apiService.getQrCode();
      return {
        'url': response['url'] as String,
        'auth_code': response['auth_code'] as String,
      };
    } catch (e) {
      AppLogger.logger.e('获取二维码失败', error: e);
      throw Exception('获取二维码失败: $e');
    }
  }

  Future<Map<String, dynamic>> pollQrCode(String authCode) async {
    try {
      final response = await _apiService.pollQrCode(authCode);
      AppLogger.logger.d('轮询二维码响应: $response');

      if (response['code'] == 0) {
        // 登录成功，保存用户信息
        final userData = response['data'];

        // 获取cookie信息
        List<Cookie> cookies = [];
        if (userData['cookie_info'] != null &&
            userData['cookie_info']['cookies'] != null) {
          final cookiesData = userData['cookie_info']['cookies'] as List;
          cookies =
              cookiesData
                  .map(
                    (cookie) => Cookie(
                      name: cookie['name'] as String,
                      value: cookie['value'] as String,
                      httpOnly: cookie['http_only'] as int,
                      expires: cookie['expires'] as int,
                      secure: cookie['secure'] as int,
                    ),
                  )
                  .toList();
        }

        // 获取csrf
        String? csrf;
        for (var cookie in cookies) {
          if (cookie.name == 'bili_jct') {
            csrf = cookie.value;
            break;
          }
        }

        // 创建用户对象
        final user = User(
          mid:
              userData['mid'] != null
                  ? int.parse(userData['mid'].toString())
                  : null,
          accessToken: userData['access_token'] as String,
          refreshToken: userData['refresh_token'] as String?,
          csrf: csrf,
          cookies: cookies,
          expiryTime: DateTime.now().add(
            Duration(seconds: userData['expires_in'] as int),
          ),
        );

        await _saveUser(user);

        // 更新API服务的cookies
        _apiService.updateCookies(cookies);
      }

      return response;
    } catch (e) {
      AppLogger.logger.e('轮询二维码状态失败', error: e);
      throw Exception('轮询二维码状态失败: $e');
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user');
      state = User.empty();

      // 清除API服务的token和cookies
      _apiService.updateToken('', null);
      _apiService.updateCookies([]);

      AppLogger.logger.i('用户已成功登出');
    } catch (e) {
      AppLogger.logger.e('登出失败', error: e);
      throw Exception('登出失败: $e');
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, User>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AuthNotifier(apiService);
});

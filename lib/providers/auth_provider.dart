import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bilihardcore_ai/models/user.dart';
import 'package:bilihardcore_ai/services/api_service.dart';

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
      print('加载用户信息失败: $e');
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
      print('保存用户信息失败: $e');
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
      print('获取二维码失败: $e');
      throw Exception('获取二维码失败: $e');
    }
  }
  
  Future<Map<String, dynamic>> pollQrCode(String authCode) async {
    try {
      final response = await _apiService.pollQrCode(authCode);
      
      if (response['code'] == 0) {
        // 登录成功，保存用户信息
        final userData = response['data'];
        final user = User(
          accessToken: userData['access_token'] as String,
          refreshToken: userData['refresh_token'] as String?,
          csrf: userData['csrf'] as String?,
          expiryTime: DateTime.now().add(const Duration(days: 30)), // 假设token有效期为30天
        );
        
        await _saveUser(user);
      }
      
      return response;
    } catch (e) {
      print('轮询二维码状态失败: $e');
      throw Exception('轮询二维码状态失败: $e');
    }
  }
  
  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user');
      state = User.empty();
      // 清除API服务的token
      _apiService.updateToken('', null);
    } catch (e) {
      print('登出失败: $e');
      throw Exception('登出失败: $e');
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, User>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AuthNotifier(apiService);
});

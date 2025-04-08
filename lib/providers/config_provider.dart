import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bilihardcore_ai/models/llm_config.dart';

class ConfigNotifier extends StateNotifier<LlmConfig> {
  ConfigNotifier() : super(LlmConfig.defaultConfig()) {
    _loadConfig();
  }
  
  Future<void> _loadConfig() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final configJson = prefs.getString('llm_config');
      
      if (configJson != null) {
        final configMap = jsonDecode(configJson) as Map<String, dynamic>;
        state = LlmConfig.fromJson(configMap);
      }
    } catch (e) {
      // 如果加载失败，保持默认配置
      print('加载配置失败: $e');
    }
  }
  
  Future<void> updateConfig(LlmConfig newConfig) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('llm_config', jsonEncode(newConfig.toJson()));
      state = newConfig;
    } catch (e) {
      print('保存配置失败: $e');
      throw Exception('保存配置失败: $e');
    }
  }
}

final configProvider = StateNotifierProvider<ConfigNotifier, LlmConfig>((ref) {
  return ConfigNotifier();
});

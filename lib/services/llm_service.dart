import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bilihardcore_ai/models/llm_config.dart';
import 'package:bilihardcore_ai/providers/config_provider.dart';
import 'package:bilihardcore_ai/utils/logger.dart';

class LlmService {
  final Dio _dio = Dio();
  final LlmConfig _config;

  LlmService(this._config);

  Future<String> getAnswer(String question, List<String> options) async {
    try {
      final prompt = _buildPrompt(question, options);

      switch (_config.llmType) {
        case LlmType.deepSeek:
          return await _callDeepSeek(prompt);
        case LlmType.gemini:
          return await _callGemini(prompt);
        case LlmType.openAi:
          return await _callOpenAi(prompt);
      }
    } catch (e) {
      // 使用日志系统记录错误
      AppLogger.logger.e('获取AI答案失败', error: e);
      return '无法获取AI答案';
    }
  }

  String _buildPrompt(String question, List<String> options) {
    final currentTime = DateTime.now().toString();
    final optionsText = options
        .asMap()
        .entries
        .map((e) => '${String.fromCharCode(65 + e.key)}. ${e.value}')
        .join('\n');
    AppLogger.logger.d(optionsText);
    return '''
当前时间：$currentTime
你是一个高效精准的答题专家，面对选择题时，直接根据问题和选项判断正确答案，并返回对应选项的序号（A, B, C, D）和答案内容。示例：
问题：大的反义词是什么？
选项：['长', '宽', '小', '热']
回答：C  【 小 】
如果不确定正确答案，选择最接近的选项序号返回，不提供额外解释或超出 A-D 的内容。
---
请回答我的问题：
问题：$question
选项：
$optionsText
''';
  }

  Future<String> _callDeepSeek(String prompt) async {
    try {
      // 根据原项目中的DeepSeek API调用方式进行调整
      final response = await _dio.post(
        'https://api.deepseek.com/v1/chat/completions',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${_config.apiKey}',
          },
        ),
        data: {
          'model': 'deepseek-chat',
          'messages': [
            {'role': 'user', 'content': prompt},
          ],
          'temperature': 0.1,
          'max_tokens': 100,
          'top_p': 0.8,
        },
      );

      return response.data['choices'][0]['message']['content'] as String;
    } catch (e) {
      throw Exception('DeepSeek API调用失败: $e');
    }
  }

  Future<String> _callGemini(String prompt) async {
    try {
      // 检查是否有自定义端点和模型
      final baseUrl =
          _config.geminiBaseUrl ?? 'https://generativelanguage.googleapis.com';
      final modelName = _config.geminiModelName ?? 'gemini-2.0-flash';

      // 构建完整的API URL
      final apiUrl = '$baseUrl/v1beta/models/$modelName:generateContent';

      AppLogger.logger.d('使用Gemini API: $apiUrl');

      // 根据原项目中的Gemini API调用方式进行调整
      final response = await _dio.post(
        apiUrl,
        options: Options(headers: {'Content-Type': 'application/json'}),
        queryParameters: {'key': _config.apiKey},
        data: {
          'contents': [
            {
              'parts': [
                {'text': prompt},
              ],
            },
          ],
          'generationConfig': {
            'temperature': 0.1,
            'topP': 0.8,
            'topK': 10,
            'maxOutputTokens': 100,
          },
        },
      );

      return response.data['candidates'][0]['content']['parts'][0]['text']
          as String;
    } catch (e) {
      throw Exception('Gemini API调用失败: $e');
    }
  }

  Future<String> _callOpenAi(String prompt) async {
    try {
      if (_config.baseUrl == null || _config.modelName == null) {
        throw Exception('OpenAI配置不完整');
      }

      // 根据原项目中的OpenAI API调用方式进行调整
      final response = await _dio.post(
        '${_config.baseUrl}/chat/completions',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${_config.apiKey}',
          },
        ),
        data: {
          'model': _config.modelName,
          'messages': [
            {'role': 'user', 'content': prompt},
          ],
          'temperature': 0.1,
          'max_tokens': 100,
          'top_p': 0.8,
        },
      );

      return response.data['choices'][0]['message']['content'] as String;
    } catch (e) {
      throw Exception('OpenAI API调用失败: $e');
    }
  }
}

final llmServiceProvider = Provider<LlmService>((ref) {
  final config = ref.watch(configProvider);
  return LlmService(config);
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
// import 'package:lucide_icons/lucide_icons.dart';
import 'package:bilihardcore_ai/providers/config_provider.dart';
import 'package:bilihardcore_ai/models/llm_config.dart';

class ConfigScreen extends ConsumerStatefulWidget {
  const ConfigScreen({super.key});

  @override
  ConsumerState<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends ConsumerState<ConfigScreen> {
  final _formKey = GlobalKey<ShadFormState>();
  late LlmType _selectedLlmType;
  final TextEditingController _apiKeyController = TextEditingController();
  final TextEditingController _baseUrlController = TextEditingController();
  final TextEditingController _modelNameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 从配置提供者获取当前配置
    final config = ref.read(configProvider);
    _selectedLlmType = config.llmType;
    _apiKeyController.text = config.apiKey;

    if (config.llmType == LlmType.openAi) {
      _baseUrlController.text = config.baseUrl ?? '';
      _modelNameController.text = config.modelName ?? '';
    } else if (config.llmType == LlmType.gemini) {
      _baseUrlController.text = config.geminiBaseUrl ?? '';
      _modelNameController.text = config.geminiModelName ?? '';
    }
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    _baseUrlController.dispose();
    _modelNameController.dispose();
    super.dispose();
  }

  void _saveConfig() {
    if (_formKey.currentState!.validate()) {
      final newConfig = LlmConfig(
        llmType: _selectedLlmType,
        apiKey: _apiKeyController.text,
        baseUrl:
            _selectedLlmType == LlmType.openAi ? _baseUrlController.text : null,
        modelName:
            _selectedLlmType == LlmType.openAi
                ? _modelNameController.text
                : null,
        geminiBaseUrl:
            _selectedLlmType == LlmType.gemini ? _baseUrlController.text : null,
        geminiModelName:
            _selectedLlmType == LlmType.gemini
                ? _modelNameController.text
                : null,
      );

      ref.read(configProvider.notifier).updateConfig(newConfig);

      ShadToaster.of(context).show(
        ShadToast(title: const Text('成功'), description: const Text('配置已保存')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('配置LLM模型'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.primaryForeground,
      ),
      body: Center(
        child: ShadCard(
          width: 500,
          title: const Text('LLM模型配置'),
          description: const Text('选择并配置用于答题的LLM模型'),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ShadForm(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('选择LLM模型'),
                  const SizedBox(height: 8),
                  Column(
                    children: [
                      RadioListTile<LlmType>(
                        title: const Text('DeepSeek'),
                        subtitle: const Text('仅需要API密钥'),
                        value: LlmType.deepSeek,
                        groupValue: _selectedLlmType,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedLlmType = value;
                              // 切换到DeepSeek时清空字段
                              _baseUrlController.text = '';
                              _modelNameController.text = '';
                            });
                          }
                        },
                      ),
                      RadioListTile<LlmType>(
                        title: const Text('Gemini'),
                        subtitle: const Text('支持自定义端点和模型'),
                        value: LlmType.gemini,
                        groupValue: _selectedLlmType,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedLlmType = value;
                              // 切换到Gemini时清空并重新加载字段
                              final config = ref.read(configProvider);
                              _baseUrlController.text =
                                  config.geminiBaseUrl ?? '';
                              _modelNameController.text =
                                  config.geminiModelName ?? '';
                            });
                          }
                        },
                      ),
                      RadioListTile<LlmType>(
                        title: const Text('OpenAI格式API（火山引擎、硅基流动等）'),
                        subtitle: const Text('支持自定义端点和模型'),
                        value: LlmType.openAi,
                        groupValue: _selectedLlmType,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedLlmType = value;
                              // 切换到OpenAI时清空并重新加载字段
                              final config = ref.read(configProvider);
                              _baseUrlController.text = config.baseUrl ?? '';
                              _modelNameController.text =
                                  config.modelName ?? '';
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ShadInputFormField(
                    id: 'apiKey',
                    controller: _apiKeyController,
                    label: Text('${_selectedLlmType.displayName} API密钥'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'API密钥不能为空';
                      }
                      return null;
                    },
                  ),
                  if (_selectedLlmType == LlmType.openAi ||
                      _selectedLlmType == LlmType.gemini) ...[
                    const SizedBox(height: 16),
                    ShadInputFormField(
                      id: 'baseUrl',
                      controller: _baseUrlController,
                      label: Text(
                        _selectedLlmType == LlmType.openAi
                            ? 'API基础URL'
                            : 'Gemini API基础URL',
                      ),
                      placeholder: Text(
                        _selectedLlmType == LlmType.openAi
                            ? '例如: https://api.openai.com/v1'
                            : '例如: https://generativelanguage.googleapis.com',
                      ),
                      validator: (value) {
                        if (_selectedLlmType == LlmType.openAi &&
                            value.isEmpty) {
                          return 'API基础URL不能为空';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ShadInputFormField(
                      id: 'modelName',
                      controller: _modelNameController,
                      label: Text(
                        _selectedLlmType == LlmType.openAi
                            ? '模型名称'
                            : 'Gemini模型名称',
                      ),
                      placeholder: Text(
                        _selectedLlmType == LlmType.openAi
                            ? '例如: gpt-3.5-turbo'
                            : '例如: gemini-2.0-flash',
                      ),
                      validator: (value) {
                        if (_selectedLlmType == LlmType.openAi &&
                            value.isEmpty) {
                          return '模型名称不能为空';
                        }
                        return null;
                      },
                    ),
                  ],
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ShadButton(
                        leading: const Icon(Icons.save),
                        onPressed: _saveConfig,
                        child: const Text('保存配置'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

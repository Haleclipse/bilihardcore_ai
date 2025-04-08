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
                        value: LlmType.deepSeek,
                        groupValue: _selectedLlmType,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedLlmType = value;
                            });
                          }
                        },
                      ),
                      RadioListTile<LlmType>(
                        title: const Text('Gemini'),
                        value: LlmType.gemini,
                        groupValue: _selectedLlmType,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedLlmType = value;
                            });
                          }
                        },
                      ),
                      RadioListTile<LlmType>(
                        title: const Text('OpenAI格式API（火山引擎、硅基流动等）'),
                        value: LlmType.openAi,
                        groupValue: _selectedLlmType,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedLlmType = value;
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
                  if (_selectedLlmType == LlmType.openAi) ...[
                    const SizedBox(height: 16),
                    ShadInputFormField(
                      id: 'baseUrl',
                      controller: _baseUrlController,
                      label: const Text('API基础URL'),
                      placeholder: const Text('例如: https://api.openai.com/v1'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'API基础URL不能为空';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ShadInputFormField(
                      id: 'modelName',
                      controller: _modelNameController,
                      label: const Text('模型名称'),
                      placeholder: const Text('例如: gpt-3.5-turbo'),
                      validator: (value) {
                        if (value.isEmpty) {
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

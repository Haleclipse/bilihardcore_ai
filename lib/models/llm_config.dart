enum LlmType {
  deepSeek,
  gemini,
  openAi;
  
  String get displayName {
    switch (this) {
      case LlmType.deepSeek:
        return 'DeepSeek';
      case LlmType.gemini:
        return 'Gemini';
      case LlmType.openAi:
        return 'OpenAI';
    }
  }
}

class LlmConfig {
  final LlmType llmType;
  final String apiKey;
  final String? baseUrl;
  final String? modelName;
  
  LlmConfig({
    required this.llmType,
    required this.apiKey,
    this.baseUrl,
    this.modelName,
  });
  
  LlmConfig copyWith({
    LlmType? llmType,
    String? apiKey,
    String? baseUrl,
    String? modelName,
  }) {
    return LlmConfig(
      llmType: llmType ?? this.llmType,
      apiKey: apiKey ?? this.apiKey,
      baseUrl: baseUrl ?? this.baseUrl,
      modelName: modelName ?? this.modelName,
    );
  }
  
  factory LlmConfig.fromJson(Map<String, dynamic> json) {
    return LlmConfig(
      llmType: LlmType.values.firstWhere(
        (e) => e.name == json['llm_type'],
        orElse: () => LlmType.deepSeek,
      ),
      apiKey: json['api_key'] as String,
      baseUrl: json['base_url'] as String?,
      modelName: json['model_name'] as String?,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'llm_type': llmType.name,
      'api_key': apiKey,
      'base_url': baseUrl,
      'model_name': modelName,
    };
  }
  
  // 默认配置
  factory LlmConfig.defaultConfig() {
    return LlmConfig(
      llmType: LlmType.deepSeek,
      apiKey: '',
    );
  }
}

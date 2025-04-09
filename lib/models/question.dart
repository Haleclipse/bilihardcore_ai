class Question {
  final String id;
  final String questionText;
  final List<String> answers;
  final List<String> answerHashes; // 添加答案的hash值列表
  final int questionNumber;
  final String? aiSuggestion;
  final String? correctAnswerIndex;
  final int? startTime; // 添加开始时间的时间戳

  Question({
    required this.id,
    required this.questionText,
    required this.answers,
    required this.answerHashes, // 添加答案的hash值列表
    required this.questionNumber,
    this.aiSuggestion,
    this.correctAnswerIndex,
    this.startTime,
  });

  Question copyWith({
    String? id,
    String? questionText,
    List<String>? answers,
    List<String>? answerHashes,
    int? questionNumber,
    String? aiSuggestion,
    String? correctAnswerIndex,
    int? startTime,
  }) {
    return Question(
      id: id ?? this.id,
      questionText: questionText ?? this.questionText,
      answers: answers ?? this.answers,
      answerHashes: answerHashes ?? this.answerHashes,
      questionNumber: questionNumber ?? this.questionNumber,
      aiSuggestion: aiSuggestion ?? this.aiSuggestion,
      correctAnswerIndex: correctAnswerIndex ?? this.correctAnswerIndex,
      startTime: startTime ?? this.startTime,
    );
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as String,
      questionText: json['question_text'] as String,
      answers: (json['answers'] as List).map((e) => e as String).toList(),
      answerHashes:
          (json['answer_hashes'] as List).map((e) => e as String).toList(),
      questionNumber: json['question_number'] as int,
      aiSuggestion: json['ai_suggestion'] as String?,
      correctAnswerIndex: json['correct_answer_index'] as String?,
      startTime: json['start_time'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question_text': questionText,
      'answers': answers,
      'answer_hashes': answerHashes,
      'question_number': questionNumber,
      'ai_suggestion': aiSuggestion,
      'correct_answer_index': correctAnswerIndex,
      'start_time': startTime,
    };
  }
}

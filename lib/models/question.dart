class Question {
  final String id;
  final String questionText;
  final List<String> answers;
  final int questionNumber;
  final String? aiSuggestion;
  final String? correctAnswerIndex;
  
  Question({
    required this.id,
    required this.questionText,
    required this.answers,
    required this.questionNumber,
    this.aiSuggestion,
    this.correctAnswerIndex,
  });
  
  Question copyWith({
    String? id,
    String? questionText,
    List<String>? answers,
    int? questionNumber,
    String? aiSuggestion,
    String? correctAnswerIndex,
  }) {
    return Question(
      id: id ?? this.id,
      questionText: questionText ?? this.questionText,
      answers: answers ?? this.answers,
      questionNumber: questionNumber ?? this.questionNumber,
      aiSuggestion: aiSuggestion ?? this.aiSuggestion,
      correctAnswerIndex: correctAnswerIndex ?? this.correctAnswerIndex,
    );
  }
  
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as String,
      questionText: json['question_text'] as String,
      answers: (json['answers'] as List).map((e) => e as String).toList(),
      questionNumber: json['question_number'] as int,
      aiSuggestion: json['ai_suggestion'] as String?,
      correctAnswerIndex: json['correct_answer_index'] as String?,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question_text': questionText,
      'answers': answers,
      'question_number': questionNumber,
      'ai_suggestion': aiSuggestion,
      'correct_answer_index': correctAnswerIndex,
    };
  }
}

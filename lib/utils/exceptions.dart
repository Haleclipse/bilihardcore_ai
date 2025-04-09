/// 自定义异常类，用于表示答题已完成的情况
class QuizCompletedException implements Exception {
  final Map<String, dynamic> quizResult;

  QuizCompletedException(this.quizResult);

  @override
  String toString() {
    return '答题已完成，可以查看结果';
  }
}

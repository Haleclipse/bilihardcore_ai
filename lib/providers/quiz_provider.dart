import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bilihardcore_ai/models/question.dart';
import 'package:bilihardcore_ai/models/category.dart';
import 'package:bilihardcore_ai/services/api_service.dart';
import 'package:bilihardcore_ai/services/llm_service.dart';
import 'package:bilihardcore_ai/utils/logger.dart';
import 'package:bilihardcore_ai/utils/exceptions.dart';

class QuizState {
  final bool isLoading;
  final List<Category> categories;
  final Category? selectedCategory;
  final Question? currentQuestion;
  final List<Question> answeredQuestions;
  final Map<String, dynamic>? quizResult; // 添加答题结果
  final String? error;

  QuizState({
    this.isLoading = false,
    this.categories = const [],
    this.selectedCategory,
    this.currentQuestion,
    this.answeredQuestions = const [],
    this.quizResult,
    this.error,
  });

  QuizState copyWith({
    bool? isLoading,
    List<Category>? categories,
    Category? selectedCategory,
    Question? currentQuestion,
    List<Question>? answeredQuestions,
    Map<String, dynamic>? quizResult,
    String? error,
  }) {
    return QuizState(
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      answeredQuestions: answeredQuestions ?? this.answeredQuestions,
      quizResult: quizResult ?? this.quizResult,
      error: error ?? this.error,
    );
  }
}

class QuizNotifier extends StateNotifier<QuizState> {
  final ApiService _apiService;
  final LlmService _llmService;
  bool _disposed = false;

  QuizNotifier(this._apiService, this._llmService) : super(QuizState());

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  Future<void> getCategories() async {
    try {
      if (_disposed) return;
      state = state.copyWith(isLoading: true);
      final categories = await _apiService.getCategories();
      if (_disposed) return;
      state = state.copyWith(isLoading: false, categories: categories);
    } catch (e) {
      if (_disposed) return;

      // 如果是答题已完成异常，则向上传递
      if (e is QuizCompletedException) {
        state = state.copyWith(isLoading: false);
        rethrow;
      }

      state = state.copyWith(isLoading: false, error: '获取分类失败: $e');
      throw Exception('获取分类失败: $e');
    }
  }

  Future<void> selectCategory(Category category) async {
    state = state.copyWith(selectedCategory: category);
  }

  Future<bool> checkCaptcha() async {
    try {
      if (_disposed) return false;
      state = state.copyWith(isLoading: true);
      final needCaptcha = await _apiService.checkCaptcha();
      if (_disposed) return false;
      state = state.copyWith(isLoading: false);
      return needCaptcha;
    } catch (e) {
      if (_disposed) return false;
      state = state.copyWith(isLoading: false, error: '检查验证码失败: $e');
      throw Exception('检查验证码失败: $e');
    }
  }

  Future<Map<String, dynamic>> getCaptcha() async {
    try {
      if (_disposed) return {};
      state = state.copyWith(isLoading: true);
      final captchaData = await _apiService.getCaptcha();
      if (_disposed) return captchaData;
      state = state.copyWith(isLoading: false);
      return captchaData;
    } catch (e) {
      if (_disposed) return {};
      state = state.copyWith(isLoading: false, error: '获取验证码失败: $e');
      throw Exception('获取验证码失败: $e');
    }
  }

  Future<bool> submitCaptcha(
    String code,
    String token,
    String categoryIds,
  ) async {
    try {
      if (_disposed) return false;
      state = state.copyWith(isLoading: true);
      final result = await _apiService.submitCaptcha(
        code,
        token,
        ids: categoryIds,
      );
      if (_disposed) return false;
      state = state.copyWith(isLoading: false);
      return result;
    } catch (e) {
      if (_disposed) return false;
      state = state.copyWith(isLoading: false, error: '提交验证码失败: $e');
      throw Exception('提交验证码失败: $e');
    }
  }

  Future<void> startQuiz() async {
    try {
      if (_disposed) return;
      state = state.copyWith(isLoading: true);
      final question = await _apiService.getQuestion();
      if (_disposed) return;

      // 使用LLM获取答案建议
      final aiSuggestion = await _llmService.getAnswer(
        question.questionText,
        question.answers,
      );
      if (_disposed) return;

      final questionWithSuggestion = question.copyWith(
        aiSuggestion: aiSuggestion,
      );

      state = state.copyWith(
        isLoading: false,
        currentQuestion: questionWithSuggestion,
      );
    } catch (e) {
      if (_disposed) return;
      state = state.copyWith(isLoading: false, error: '获取题目失败: $e');
      throw Exception('获取题目失败: $e');
    }
  }

  Future<Map<String, dynamic>?> submitAnswer(int answerIndex) async {
    try {
      if (_disposed) return null;
      if (state.currentQuestion == null) {
        throw Exception('当前没有题目');
      }

      state = state.copyWith(isLoading: true);

      final currentQuestion = state.currentQuestion!;
      final answerText = currentQuestion.answers[answerIndex];

      // 使用正确的answerHash
      final result = await _apiService.submitAnswer(
        currentQuestion.id,
        currentQuestion.answerHashes[answerIndex], // 使用答案的hash值
        answerText,
      );
      if (_disposed) return null;

      // 将当前题目添加到已回答列表
      final answeredQuestions = [...state.answeredQuestions, currentQuestion];

      // 检查是否已经回答了100题
      final bool reachedMaxQuestions = answeredQuestions.length >= 100;

      // 记录当前答题数量
      AppLogger.logger.i('当前已答题目数量: ${answeredQuestions.length}');

      if (result['code'] == 0 && !reachedMaxQuestions) {
        // 获取下一题
        final nextQuestion = await _apiService.getQuestion();
        if (_disposed) return null;

        // 使用LLM获取答案建议
        final aiSuggestion = await _llmService.getAnswer(
          nextQuestion.questionText,
          nextQuestion.answers,
        );
        if (_disposed) return null;

        final nextQuestionWithSuggestion = nextQuestion.copyWith(
          aiSuggestion: aiSuggestion,
        );

        state = state.copyWith(
          isLoading: false,
          currentQuestion: nextQuestionWithSuggestion,
          answeredQuestions: answeredQuestions,
        );
      } else if (result['code'] == 90001 || reachedMaxQuestions) {
        // 答题结束或者已经回答了100题
        AppLogger.logger.i(
          '答题完成，获取结果。原因: ${reachedMaxQuestions ? "已答满100题" : "服务器返回结束代码"}',
        );
        // 获取答题结果
        try {
          final quizResult = await _apiService.getQuizResult();
          if (_disposed) return null;

          state = state.copyWith(
            isLoading: false,
            currentQuestion: null,
            answeredQuestions: answeredQuestions,
            quizResult: quizResult,
          );
          return quizResult; // 返回答题结果，供外部使用
        } catch (e) {
          if (_disposed) return null;

          state = state.copyWith(
            isLoading: false,
            currentQuestion: null,
            answeredQuestions: answeredQuestions,
            error: '获取答题结果失败: $e',
          );
          throw Exception('获取答题结果失败: $e');
        }
      } else {
        // 其他错误
        if (_disposed) return null;

        state = state.copyWith(
          isLoading: false,
          currentQuestion: null,
          answeredQuestions: answeredQuestions,
          error: result['message'] as String?,
        );
      }
    } catch (e) {
      if (_disposed) return null;

      state = state.copyWith(isLoading: false, error: '提交答案失败: $e');
      throw Exception('提交答案失败: $e');
    }
    return null; // 如果没有结枟，返回null
  }
}

final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  final llmService = ref.watch(llmServiceProvider);
  return QuizNotifier(apiService, llmService);
});

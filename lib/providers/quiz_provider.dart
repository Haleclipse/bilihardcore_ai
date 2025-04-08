import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bilihardcore_ai/models/question.dart';
import 'package:bilihardcore_ai/models/category.dart';
import 'package:bilihardcore_ai/services/api_service.dart';
import 'package:bilihardcore_ai/services/llm_service.dart';

class QuizState {
  final bool isLoading;
  final List<Category> categories;
  final Category? selectedCategory;
  final Question? currentQuestion;
  final List<Question> answeredQuestions;
  final String? error;

  QuizState({
    this.isLoading = false,
    this.categories = const [],
    this.selectedCategory,
    this.currentQuestion,
    this.answeredQuestions = const [],
    this.error,
  });

  QuizState copyWith({
    bool? isLoading,
    List<Category>? categories,
    Category? selectedCategory,
    Question? currentQuestion,
    List<Question>? answeredQuestions,
    String? error,
  }) {
    return QuizState(
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      answeredQuestions: answeredQuestions ?? this.answeredQuestions,
      error: error ?? this.error,
    );
  }
}

class QuizNotifier extends StateNotifier<QuizState> {
  final ApiService _apiService;
  final LlmService _llmService;

  QuizNotifier(this._apiService, this._llmService) : super(QuizState());

  Future<void> getCategories() async {
    try {
      state = state.copyWith(isLoading: true);
      final categories = await _apiService.getCategories();
      state = state.copyWith(isLoading: false, categories: categories);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '获取分类失败: $e');
      throw Exception('获取分类失败: $e');
    }
  }

  Future<void> selectCategory(Category category) async {
    state = state.copyWith(selectedCategory: category);
  }

  Future<bool> checkCaptcha() async {
    try {
      state = state.copyWith(isLoading: true);
      final needCaptcha = await _apiService.checkCaptcha();
      state = state.copyWith(isLoading: false);
      return needCaptcha;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '检查验证码失败: $e');
      throw Exception('检查验证码失败: $e');
    }
  }

  Future<Map<String, dynamic>> getCaptcha() async {
    try {
      state = state.copyWith(isLoading: true);
      final captchaData = await _apiService.getCaptcha();
      state = state.copyWith(isLoading: false);
      return captchaData;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '获取验证码失败: $e');
      throw Exception('获取验证码失败: $e');
    }
  }

  Future<bool> submitCaptcha(String code, String token) async {
    try {
      state = state.copyWith(isLoading: true);
      final result = await _apiService.submitCaptcha(code, token);
      state = state.copyWith(isLoading: false);
      return result;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '提交验证码失败: $e');
      throw Exception('提交验证码失败: $e');
    }
  }

  Future<void> startQuiz() async {
    try {
      state = state.copyWith(isLoading: true);
      final question = await _apiService.getQuestion();

      // 使用LLM获取答案建议
      final aiSuggestion = await _llmService.getAnswer(
        question.questionText,
        question.answers,
      );

      final questionWithSuggestion = question.copyWith(
        aiSuggestion: aiSuggestion,
      );

      state = state.copyWith(
        isLoading: false,
        currentQuestion: questionWithSuggestion,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '获取题目失败: $e');
      throw Exception('获取题目失败: $e');
    }
  }

  Future<void> submitAnswer(int answerIndex) async {
    try {
      if (state.currentQuestion == null) {
        throw Exception('当前没有题目');
      }

      state = state.copyWith(isLoading: true);

      final currentQuestion = state.currentQuestion!;
      final answerText = currentQuestion.answers[answerIndex];

      // 在原项目中，ans_hash是选项的索引
      final result = await _apiService.submitAnswer(
        currentQuestion.id,
        answerIndex.toString(), // ans_hash 是索引
        answerText,
      );

      // 将当前题目添加到已回答列表
      final answeredQuestions = [...state.answeredQuestions, currentQuestion];

      if (result['code'] == 0) {
        // 获取下一题
        final nextQuestion = await _apiService.getQuestion();

        // 使用LLM获取答案建议
        final aiSuggestion = await _llmService.getAnswer(
          nextQuestion.questionText,
          nextQuestion.answers,
        );

        final nextQuestionWithSuggestion = nextQuestion.copyWith(
          aiSuggestion: aiSuggestion,
        );

        state = state.copyWith(
          isLoading: false,
          currentQuestion: nextQuestionWithSuggestion,
          answeredQuestions: answeredQuestions,
        );
      } else {
        // 答题结束或出错
        state = state.copyWith(
          isLoading: false,
          currentQuestion: null,
          answeredQuestions: answeredQuestions,
          error: result['message'] as String?,
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '提交答案失败: $e');
      throw Exception('提交答案失败: $e');
    }
  }
}

final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  final llmService = ref.watch(llmServiceProvider);
  return QuizNotifier(apiService, llmService);
});

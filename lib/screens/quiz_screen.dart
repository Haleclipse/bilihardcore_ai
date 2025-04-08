import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
// import 'package:lucide_icons/lucide_icons.dart';
import 'package:bilihardcore_ai/providers/quiz_provider.dart';
import 'package:bilihardcore_ai/models/question.dart';
import 'package:bilihardcore_ai/screens/captcha_screen.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  @override
  void initState() {
    super.initState();
    _initQuiz();
  }

  Future<void> _initQuiz() async {
    try {
      // 获取分类列表
      await ref.read(quizProvider.notifier).getCategories();

      // 检查是否需要验证码
      final needCaptcha = await ref.read(quizProvider.notifier).checkCaptcha();

      if (needCaptcha && mounted) {
        // 跳转到验证码页面
        final result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CaptchaScreen()),
        );

        if (result == true) {
          // 验证码验证成功，开始答题
          await ref.read(quizProvider.notifier).startQuiz();
        }
      } else {
        // 不需要验证码，直接开始答题
        await ref.read(quizProvider.notifier).startQuiz();
      }
    } catch (e) {
      if (mounted) {
        ShadToaster.of(context).show(
          ShadToast.destructive(
            title: const Text('错误'),
            description: Text('初始化答题失败: $e'),
          ),
        );
      }
    }
  }

  void _submitAnswer(int answerIndex) async {
    try {
      await ref.read(quizProvider.notifier).submitAnswer(answerIndex);
    } catch (e) {
      if (mounted) {
        ShadToaster.of(context).show(
          ShadToast.destructive(
            title: const Text('错误'),
            description: Text('提交答案失败: $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final quizState = ref.watch(quizProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('硬核会员答题'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.primaryForeground,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child:
              quizState.isLoading
                  ? const CircularProgressIndicator()
                  : quizState.currentQuestion == null
                  ? const Text('暂无题目')
                  : _buildQuestionCard(quizState.currentQuestion!),
        ),
      ),
    );
  }

  Widget _buildQuestionCard(Question question) {
    return ShadCard(
      width: 600,
      title: Text('问题 ${question.questionNumber}'),
      description: Text(question.questionText),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              question.answers.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ShadButton.outline(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${index + 1}. ${question.answers[index]}',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  onPressed: () => _submitAnswer(index),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (question.aiSuggestion != null) ...[
              const ShadSeparator.horizontal(),
              const SizedBox(height: 16),
              Text(
                'AI推荐答案: ${question.aiSuggestion}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

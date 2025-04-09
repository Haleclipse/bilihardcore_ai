import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
// import 'package:lucide_icons/lucide_icons.dart';
import 'package:bilihardcore_ai/providers/quiz_provider.dart';
import 'package:bilihardcore_ai/models/question.dart';
import 'package:bilihardcore_ai/screens/captcha_screen.dart';
import 'package:bilihardcore_ai/screens/category_selection_screen.dart';
import 'package:bilihardcore_ai/screens/quiz_result_screen.dart';
import 'package:bilihardcore_ai/utils/logger.dart';
import 'package:bilihardcore_ai/utils/time_utils.dart';
import 'package:bilihardcore_ai/utils/exceptions.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  @override
  void initState() {
    super.initState();
    // 使用Future.microtask延迟初始化，确保在构建完成后调用
    Future.microtask(() => _initQuiz());
  }

  Future<void> _initQuiz() async {
    try {
      // 获取分类列表
      try {
        await ref.read(quizProvider.notifier).getCategories();
      } catch (e) {
        // 检查是否是答题已完成异常
        if (e is QuizCompletedException && mounted) {
          AppLogger.logger.i('检测到用户已经完成答题，直接显示结果页面');

          // 直接跳转到结果页面
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizResultScreen(result: (e).quizResult),
            ),
          );

          // 跳转后返回上一页
          if (mounted) {
            Navigator.pop(context);
          }
          return;
        } else {
          // 其他错误则向上抛出
          rethrow;
        }
      }

      // 获取当前分类列表
      final categories = ref.read(quizProvider).categories;

      // 如果分类列表为空，表示用户已经选择过分类，直接检查验证码
      if (categories.isEmpty) {
        AppLogger.logger.i('用户已经选择过分类，直接检查验证码');

        // 检查是否需要验证码
        final needCaptcha =
            await ref.read(quizProvider.notifier).checkCaptcha();

        if (needCaptcha && mounted) {
          // 需要验证码，跳转到验证码页面
          // 由于已经选择过分类，使用空字符串作为分类 ID
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CaptchaScreen(categoryIds: ''),
            ),
          );

          if (result == true) {
            // 验证码验证成功，开始答题
            await ref.read(quizProvider.notifier).startQuiz();
          }
        } else {
          // 不需要验证码，直接开始答题
          await ref.read(quizProvider.notifier).startQuiz();
        }
      } else {
        // 有分类列表，需要选择分类

        // 检查是否需要验证码
        final needCaptcha =
            await ref.read(quizProvider.notifier).checkCaptcha();

        if (needCaptcha && mounted) {
          // 先跳转到分类选择页面
          final categoryIds = await Navigator.push<String>(
            context,
            MaterialPageRoute(
              builder: (context) => const CategorySelectionScreen(),
            ),
          );

          if (categoryIds != null && mounted) {
            // 然后跳转到验证码页面
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CaptchaScreen(categoryIds: categoryIds),
              ),
            );

            if (result == true) {
              // 验证码验证成功，开始答题
              await ref.read(quizProvider.notifier).startQuiz();
            }
          }
        } else {
          // 不需要验证码，直接开始答题
          await ref.read(quizProvider.notifier).startQuiz();
        }
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
      final result = await ref
          .read(quizProvider.notifier)
          .submitAnswer(answerIndex);

      // 如果返回了结果，说明答题结束，跳转到结果页面
      if (result != null && mounted) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizResultScreen(result: result),
          ),
        );
      }
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
    final colorScheme = theme.colorScheme;
    final quizState = ref.watch(quizProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('硬核会员答题'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.primaryForeground,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colorScheme.primary.withAlpha(13), colorScheme.background],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child:
                quizState.isLoading
                    ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text('正在加载题目...'),
                        ],
                      ),
                    )
                    : quizState.currentQuestion == null
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.quiz_outlined,
                            size: 64,
                            color: colorScheme.muted,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '暂无题目',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '请稍后再试',
                            style: TextStyle(color: colorScheme.muted),
                          ),
                        ],
                      ),
                    )
                    : _buildQuestionCard(quizState.currentQuestion!),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard(Question question) {
    final colorScheme = ShadTheme.of(context).colorScheme;

    return ShadCard(
      width: 600,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '问题 ${question.questionNumber} / 100',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const ShadSeparator.horizontal(),
          const SizedBox(height: 8),
        ],
      ),

      description: Text(
        question.questionText,
        style: const TextStyle(fontSize: 16),
      ),
      footer:
          question.aiSuggestion != null
              ? Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withAlpha(20),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: colorScheme.primary.withAlpha(50)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: colorScheme.primary,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'AI推荐答案:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(question.aiSuggestion!),
                  ],
                ),
              )
              : null,
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
                  // variant: ShadButtonVariant.secondary, // 不支持的参数
                  child: Stack(
                    children: [
                      // 序号放在最左侧
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: Text(
                            String.fromCharCode(0x24B6 + index),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.destructive,
                            ),
                          ),
                        ),
                      ),
                      // 内容居中对齐
                      Padding(
                        padding: const EdgeInsets.only(left: 36.0, right: 12.0),
                        child: Center(
                          child: Text(
                            question.answers[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () => _submitAnswer(index),
                ),
              ),
            ),

            // 显示开始时间
            if (question.startTime != null) ...[
              const SizedBox(height: 16),
              const ShadSeparator.horizontal(),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.access_time,
                    size: 16,
                    color: colorScheme.destructive,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '本次答题开始于 ${TimeUtils.getRelativeTime(question.startTime)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.destructive,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

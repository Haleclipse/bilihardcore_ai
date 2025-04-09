import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class QuizResultScreen extends StatelessWidget {
  final Map<String, dynamic> result;

  const QuizResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;
    final totalScore = result['score'] as int;
    final scores = result['scores'] as List;

    // 判断是否通过答题（总分大于等于60分）
    final bool isPassed = totalScore >= 60;

    return Scaffold(
      appBar: AppBar(
        title: const Text('答题结果'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.primaryForeground,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primary.withAlpha(13),
              colorScheme.background,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // 总分卡片
                ShadCard(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        // 标题和图标
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isPassed ? Icons.emoji_events : Icons.sentiment_neutral,
                              size: 32,
                              color: isPassed ? Colors.amber : colorScheme.muted,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              isPassed ? '恭喜通过答题！' : '答题完成',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // 总分大圆环
                        SizedBox(
                          width: 160,
                          height: 160,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 160,
                                height: 160,
                                child: CircularProgressIndicator(
                                  value: totalScore / 100,
                                  strokeWidth: 12,
                                  backgroundColor: colorScheme.secondary.withAlpha(40),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    isPassed ? colorScheme.primary : colorScheme.destructive,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '$totalScore',
                                    style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: isPassed ? colorScheme.primary : colorScheme.destructive,
                                    ),
                                  ),
                                  Text(
                                    '总分',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: colorScheme.muted,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // 通过状态
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: isPassed ? colorScheme.primary.withAlpha(20) : colorScheme.destructive.withAlpha(20),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            isPassed ? '已获得硬核会员资格' : '未获得硬核会员资格',
                            style: TextStyle(
                              color: isPassed ? colorScheme.primary : colorScheme.destructive,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 分类得分卡片
                ShadCard(
                  width: 400,
                  title: Row(
                    children: [
                      Icon(Icons.pie_chart, size: 20, color: colorScheme.primary),
                      const SizedBox(width: 8),
                      const Text('分类得分详情'),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ...scores.map((score) {
                          final category = score['category'] as String;
                          final categoryScore = score['score'] as int;
                          final total = score['total'] as int;
                          final percentage = (categoryScore / total * 100).toStringAsFixed(1);
                          final isGoodScore = categoryScore >= (total * 0.6);

                          return Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: colorScheme.card,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: colorScheme.border),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(5),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      category,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: isGoodScore
                                            ? colorScheme.primary.withAlpha(20)
                                            : colorScheme.muted.withAlpha(20),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        '$percentage%',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: isGoodScore
                                              ? colorScheme.primary
                                              : colorScheme.muted,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: LinearProgressIndicator(
                                          value: categoryScore / total,
                                          backgroundColor: colorScheme.secondary.withAlpha(40),
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            isGoodScore
                                                ? colorScheme.primary
                                                : colorScheme.muted,
                                          ),
                                          minHeight: 8,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      '$categoryScore/$total',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: colorScheme.foreground,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),

                        const SizedBox(height: 16),

                        ShadButton(
                          width: double.infinity,
                          onPressed: () => Navigator.pop(context),
                          child: const Text('返回首页'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

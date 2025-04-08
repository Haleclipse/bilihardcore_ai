import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
// import 'package:lucide_icons/lucide_icons.dart';
import 'package:bilihardcore_ai/screens/login_screen.dart';
import 'package:bilihardcore_ai/screens/config_screen.dart';
import 'package:bilihardcore_ai/screens/quiz_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('B站硬核会员'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.primaryForeground,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShadCard(
                width: 400,
                title: const Text('B站硬核会员自动答题'),
                description: const Text('利用LLM实现智能答题功能'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      ShadButton(
                        leading: const Icon(Icons.login),
                        child: const Text('登录B站账号'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      ShadButton.secondary(
                        leading: const Icon(Icons.settings),
                        child: const Text('配置LLM模型'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ConfigScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      ShadButton.outline(
                        leading: const Icon(Icons.psychology),
                        child: const Text('开始答题'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuizScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

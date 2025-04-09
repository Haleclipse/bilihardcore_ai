import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
// import 'package:lucide_icons/lucide_icons.dart';
import 'package:bilihardcore_ai/providers/auth_provider.dart';
import 'package:bilihardcore_ai/screens/login_screen.dart';
import 'package:bilihardcore_ai/screens/config_screen.dart';
import 'package:bilihardcore_ai/screens/quiz_screen.dart';
import 'package:bilihardcore_ai/screens/user_profile_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('B站硬核会员'),
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
              colorScheme.primary.withValues(alpha: 0.05),
              colorScheme.background,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShadCard(
                  width: 400,
                  title: const Text('B站硬核会员自动答题'),
                  description: const Text('利用人工智能实现智能答题功能'),
                  footer: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '轻松获取硬核会员资格',
                      style: TextStyle(
                        color: ShadTheme.of(context).textTheme.muted.color,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Consumer(
                          builder: (context, ref, child) {
                            final user = ref.watch(authProvider);
                            final isLoggedIn = user.isLoggedIn;

                            return ShadButton(
                              width: double.infinity,
                              leading: Icon(
                                isLoggedIn ? Icons.account_circle : Icons.login,
                              ),
                              child: Text(isLoggedIn ? '用户信息' : '登录B站账号'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            isLoggedIn
                                                ? const UserProfileScreen()
                                                : const LoginScreen(),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        ShadButton.secondary(
                          width: double.infinity,
                          leading: const Icon(Icons.settings),
                          child: const Text('配置人工智能模型'),
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
                          width: double.infinity,
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
      ),
    );
  }
}

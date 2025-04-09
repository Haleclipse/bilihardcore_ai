import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:bilihardcore_ai/providers/auth_provider.dart';
import 'package:bilihardcore_ai/screens/login_screen.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final user = ref.watch(authProvider);
    final isLoggedIn = user.isLoggedIn;

    return Scaffold(
      appBar: AppBar(
        title: const Text('用户信息'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.primaryForeground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child:
              isLoggedIn
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 100,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '用户ID: ${user.mid ?? "未知"}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '登录状态: ${user.isTokenExpired ? "已过期" : "有效"}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      if (user.expiryTime != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          '过期时间: ${user.expiryTime!.toLocal()}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                      const SizedBox(height: 32),
                      ShadButton(
                        onPressed: () async {
                          try {
                            await ref.read(authProvider.notifier).logout();
                            if (context.mounted) {
                              ShadToaster.of(context).show(
                                const ShadToast(
                                  title: Text('成功'),
                                  description: Text('已成功退出登录'),
                                ),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ShadToaster.of(context).show(
                                ShadToast.destructive(
                                  title: const Text('错误'),
                                  description: Text('退出登录失败: $e'),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('退出登录'),
                      ),
                    ],
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.account_circle_outlined,
                        size: 100,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '未登录',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),
                      ShadButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text('去登录'),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
// import 'package:lucide_icons/lucide_icons.dart';
import 'package:bilihardcore_ai/providers/quiz_provider.dart';

class CaptchaScreen extends ConsumerStatefulWidget {
  const CaptchaScreen({super.key});

  @override
  ConsumerState<CaptchaScreen> createState() => _CaptchaScreenState();
}

class _CaptchaScreenState extends ConsumerState<CaptchaScreen> {
  final TextEditingController _captchaController = TextEditingController();
  bool _isLoading = false;
  String? _captchaImageUrl;
  String? _captchaToken;

  @override
  void initState() {
    super.initState();
    _getCaptcha();
  }

  @override
  void dispose() {
    _captchaController.dispose();
    super.dispose();
  }

  Future<void> _getCaptcha() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final captchaData = await ref.read(quizProvider.notifier).getCaptcha();
      setState(() {
        _captchaImageUrl = captchaData['image_url'] as String;
        _captchaToken = captchaData['token'] as String;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ShadToaster.of(context).show(
          ShadToast.destructive(
            title: const Text('错误'),
            description: Text('获取验证码失败: $e'),
          ),
        );
      }
    }
  }

  Future<void> _submitCaptcha() async {
    if (_captchaController.text.isEmpty) {
      ShadToaster.of(context).show(
        const ShadToast.destructive(
          title: Text('错误'),
          description: Text('请输入验证码'),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final result = await ref
          .read(quizProvider.notifier)
          .submitCaptcha(_captchaController.text, _captchaToken!);

      setState(() {
        _isLoading = false;
      });

      if (result) {
        if (mounted) {
          ShadToaster.of(context).show(
            ShadToast(
              title: const Text('成功'),
              description: const Text('验证码验证成功'),
            ),
          );

          // 返回上一页，并传递成功状态
          Navigator.pop(context, true);
        }
      } else {
        // 验证码错误，重新获取
        _getCaptcha();
        _captchaController.clear();

        if (mounted) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('错误'),
              description: const Text('验证码错误，请重新输入'),
            ),
          );
        }
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ShadToaster.of(context).show(
          ShadToast.destructive(
            title: const Text('错误'),
            description: Text('提交验证码失败: $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('验证码'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.primaryForeground,
      ),
      body: Center(
        child: ShadCard(
          width: 400,
          title: const Text('请输入验证码'),
          description: const Text('请输入图片中显示的验证码'),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_isLoading)
                  const CircularProgressIndicator()
                else if (_captchaImageUrl != null)
                  Image.network(
                    _captchaImageUrl!,
                    height: 100,
                    fit: BoxFit.contain,
                  )
                else
                  const Text('获取验证码失败'),
                const SizedBox(height: 16),
                ShadInput(
                  controller: _captchaController,
                  placeholder: const Text('请输入验证码'),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShadButton.outline(
                      leading: const Icon(Icons.refresh),
                      onPressed: _getCaptcha,
                      child: const Text('刷新验证码'),
                    ),
                    ShadButton(
                      leading: const Icon(Icons.check),
                      onPressed: _submitCaptcha,
                      child: const Text('提交'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

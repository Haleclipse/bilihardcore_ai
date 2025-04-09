import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
// import 'package:lucide_icons/lucide_icons.dart';
import 'package:bilihardcore_ai/providers/quiz_provider.dart';

class CaptchaScreen extends ConsumerStatefulWidget {
  final String categoryIds;

  const CaptchaScreen({super.key, required this.categoryIds});

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
    // 使用Future.microtask延迟初始化，确保在构建完成后调用
    Future.microtask(() => _getCaptcha());
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

      // 检查验证码数据是否完整
      if (captchaData.isEmpty ||
          !captchaData.containsKey('image_url') ||
          !captchaData.containsKey('token')) {
        setState(() {
          _isLoading = false;
        });

        if (mounted) {
          ShadToaster.of(context).show(
            const ShadToast.destructive(
              title: Text('错误'),
              description: Text('验证码数据不完整'),
            ),
          );
        }
        return;
      }

      setState(() {
        _captchaImageUrl = captchaData['image_url'];
        _captchaToken = captchaData['token'];
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

    if (_captchaToken == null || _captchaImageUrl == null) {
      ShadToaster.of(context).show(
        const ShadToast.destructive(
          title: Text('错误'),
          description: Text('验证码数据不完整，请刷新验证码'),
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
          .submitCaptcha(
            _captchaController.text,
            _captchaToken!, // 已经在上面进行了空值检查
            widget.categoryIds,
          );

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
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('验证码'),
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
          child: ShadCard(
            width: 400,
            title: const Text('请输入验证码'),
            description: const Text('请输入图片中显示的验证码'),
            footer: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '验证码区分大小写，请仔细输入',
                style: TextStyle(color: colorScheme.muted, fontSize: 12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_isLoading)
                    const SizedBox(
                      height: 100,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (_captchaImageUrl != null)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: colorScheme.border),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Image.network(
                        _captchaImageUrl!,
                        height: 100,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                            height: 100,
                            child: Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return SizedBox(
                            height: 100,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: colorScheme.destructive,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text('加载验证码失败'),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  else
                    SizedBox(
                      height: 100,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: colorScheme.destructive,
                            ),
                            const SizedBox(height: 8),
                            const Text('获取验证码失败'),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 24),
                  ShadInput(
                    controller: _captchaController,
                    placeholder: const Text('请输入验证码'),
                    keyboardType: TextInputType.text,
                    autofocus: true,
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
      ),
    );
  }
}

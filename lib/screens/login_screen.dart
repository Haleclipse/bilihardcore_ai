import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:bilihardcore_ai/providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isLoading = false;
  String? _qrCodeUrl;
  String? _authCode;
  Timer? _pollTimer;

  @override
  void initState() {
    super.initState();
    _getQrCode();
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  Future<void> _getQrCode() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 这里将来会实现真正的QR码获取逻辑
      final qrData = await ref.read(authProvider.notifier).getQrCode();
      setState(() {
        _qrCodeUrl = qrData['url'] as String;
        _authCode = qrData['auth_code'] as String;
        _isLoading = false;
      });

      // 开始轮询二维码状态
      _startPolling();
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ShadToaster.of(context).show(
          ShadToast.destructive(
            title: const Text('错误'),
            description: Text('获取二维码失败: $e'),
          ),
        );
      }
    }
  }

  void _startPolling() {
    _pollTimer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (_authCode == null) {
        timer.cancel();
        return;
      }

      try {
        final result = await ref
            .read(authProvider.notifier)
            .pollQrCode(_authCode!);

        if (result['code'] == 0) {
          // 登录成功
          timer.cancel();

          if (mounted) {
            ShadToaster.of(context).show(
              ShadToast(
                title: const Text('成功'),
                description: const Text('登录成功'),
              ),
            );

            // 返回上一页
            Navigator.pop(context);
          }
        } else if (result['code'] == 86038) {
          // 二维码已失效，重新获取
          timer.cancel();
          _getQrCode();
        }
      } catch (e) {
        // 错误处理
        if (mounted) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('错误'),
              description: Text('轮询二维码状态失败: $e'),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('登录B站账号'),
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
              colorScheme.primary.withAlpha(13), // 约等于0.05的透明度
              colorScheme.background,
            ],
          ),
        ),
        child: Center(
          child: ShadCard(
            width: 400,
            title: const Text('扫描二维码登录'),
            description: const Text('请使用B站APP扫描二维码登录'),
            footer: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '二维码有效期为3分钟，过期后请刷新',
                style: TextStyle(color: colorScheme.muted, fontSize: 12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_isLoading)
                    const SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (_qrCodeUrl != null)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: colorScheme.border),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: QrImageView(
                        data: _qrCodeUrl!,
                        version: QrVersions.auto,
                        size: 200.0,
                        backgroundColor: Colors.white,
                        dataModuleStyle: const QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.square,
                          color: Colors.black,
                        ),
                      ),
                    )
                  else
                    Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: colorScheme.destructive,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          const Text('获取二维码失败'),
                        ],
                      ),
                    ),
                  const SizedBox(height: 24),
                  ShadButton.outline(
                    width: double.infinity,
                    leading: const Icon(Icons.refresh),
                    onPressed: _getQrCode,
                    child: const Text('刷新二维码'),
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

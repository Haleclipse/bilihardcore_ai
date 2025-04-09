import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:bilihardcore_ai/utils/logger.dart';

class TicketGenerator {
  static Future<String> getTicket() async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final hexSign = _hmacSha256('XgwSnGZ1p', 'ts$timestamp');

      // 根据原项目的Python实现进行调整
      final dio = Dio();

      // 构建查询参数，而不是表单数据
      final queryParams = {
        'key_id': 'ec02',
        'hexsign': hexSign,
        'context[ts]': timestamp.toString(), // 确保时间戳格式正确
        'csrf': '',
      };

      final response = await dio.post(
        'https://api.bilibili.com/bapis/bilibili.api.ticket.v1.Ticket/GenWebTicket',
        options: Options(
          headers: {
            'user-agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0',
          },
        ),
        queryParameters: queryParams, // 使用查询参数而不是表单数据
      );

      // 记录响应信息以便调试
      AppLogger.logger.d('Ticket API response: ${response.data}');

      if (response.data['code'] == 0) {
        return response.data['data']['ticket'] as String;
      } else {
        throw Exception('获取ticket失败: ${response.data['message']}');
      }
    } catch (e) {
      AppLogger.logger.e('获取ticket失败', error: e);
      throw Exception('获取ticket失败: $e');
    }
  }

  static String _hmacSha256(String key, String message) {
    final keyBytes = utf8.encode(key);
    final messageBytes = utf8.encode(message);

    final hmac = Hmac(sha256, keyBytes);
    final digest = hmac.convert(messageBytes);

    return digest.toString();
  }
}

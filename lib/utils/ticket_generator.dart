import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class TicketGenerator {
  static Future<String> getTicket() async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final hexSign = _hmacSha256('XgwSnGZ1p', 'ts$timestamp');

      final url = Uri.parse(
        'https://api.bilibili.com/bapis/bilibili.api.ticket.v1.Ticket/GenWebTicket',
      );
      final response = await http.post(
        url,
        headers: {
          'user-agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0',
        },
        body: {
          'key_id': 'ec02',
          'hexsign': hexSign,
          'context[ts]': timestamp.toString(),
          'csrf': '',
        },
      );

      final responseData = jsonDecode(response.body);
      print(responseData);
      if (responseData['code'] == 0) {
        return responseData['data']['ticket'] as String;
      } else {
        throw Exception('获取ticket失败: ${responseData['message']}');
      }
    } catch (e) {
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

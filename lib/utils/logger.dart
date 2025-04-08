import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );
  
  static Logger get logger => _logger;
  
  static Future<void> logToFile(String message, {LogLevel level = LogLevel.info}) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final logDir = Directory('${directory.path}/logs');
      
      if (!await logDir.exists()) {
        await logDir.create(recursive: true);
      }
      
      final now = DateTime.now();
      final fileName = '${now.year}-${now.month}-${now.day}.log';
      final file = File('${logDir.path}/$fileName');
      
      final timestamp = now.toIso8601String();
      final levelStr = level.toString().split('.').last.toUpperCase();
      
      await file.writeAsString(
        '[$timestamp] [$levelStr] $message\n',
        mode: FileMode.append,
      );
    } catch (e) {
      _logger.e('写入日志文件失败: $e');
    }
  }
}

enum LogLevel {
  verbose,
  debug,
  info,
  warning,
  error,
  wtf,
}

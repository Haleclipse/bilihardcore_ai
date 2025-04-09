class TimeUtils {
  /// 将时间戳转换为相对时间（几分钟前、几小时前等）
  static String getRelativeTime(int? timestamp) {
    if (timestamp == null) {
      return '';
    }

    final now = DateTime.now();
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '刚刚';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} 分钟前';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} 小时前';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} 天前';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months 个月前';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years 年前';
    }
  }
}

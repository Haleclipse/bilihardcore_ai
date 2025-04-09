class User {
  final String accessToken;
  final String? refreshToken;
  final String? csrf;
  final String? username;
  final String? avatar;
  final DateTime? expiryTime;
  final int? mid; // 用户ID
  final List<Cookie>? cookies; // 用户cookie

  User({
    required this.accessToken,
    this.refreshToken,
    this.csrf,
    this.username,
    this.avatar,
    this.expiryTime,
    this.mid,
    this.cookies,
  });

  bool get isLoggedIn => accessToken.isNotEmpty;

  bool get isTokenExpired {
    if (expiryTime == null) return false;
    return DateTime.now().isAfter(expiryTime!);
  }

  User copyWith({
    String? accessToken,
    String? refreshToken,
    String? csrf,
    String? username,
    String? avatar,
    DateTime? expiryTime,
    int? mid,
    List<Cookie>? cookies,
  }) {
    return User(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      csrf: csrf ?? this.csrf,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      expiryTime: expiryTime ?? this.expiryTime,
      mid: mid ?? this.mid,
      cookies: cookies ?? this.cookies,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    List<Cookie>? cookies;
    if (json['cookies'] != null) {
      cookies =
          (json['cookies'] as List)
              .map((cookie) => Cookie.fromJson(cookie as Map<String, dynamic>))
              .toList();
    }

    return User(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String?,
      csrf: json['csrf'] as String?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      expiryTime:
          json['expiry_time'] != null
              ? DateTime.parse(json['expiry_time'] as String)
              : null,
      mid: json['mid'] != null ? int.parse(json['mid'].toString()) : null,
      cookies: cookies,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'csrf': csrf,
      'username': username,
      'avatar': avatar,
      'expiry_time': expiryTime?.toIso8601String(),
      'mid': mid,
      'cookies': cookies?.map((cookie) => cookie.toJson()).toList(),
    };
  }

  // 创建一个空用户
  factory User.empty() {
    return User(accessToken: '');
  }
}

class Cookie {
  final String name;
  final String value;
  final int httpOnly;
  final int expires;
  final int secure;

  Cookie({
    required this.name,
    required this.value,
    required this.httpOnly,
    required this.expires,
    required this.secure,
  });

  factory Cookie.fromJson(Map<String, dynamic> json) {
    return Cookie(
      name: json['name'] as String,
      value: json['value'] as String,
      httpOnly: json['http_only'] as int,
      expires: json['expires'] as int,
      secure: json['secure'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
      'http_only': httpOnly,
      'expires': expires,
      'secure': secure,
    };
  }
}

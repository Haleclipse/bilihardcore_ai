class User {
  final String accessToken;
  final String? refreshToken;
  final String? csrf;
  final String? username;
  final String? avatar;
  final DateTime? expiryTime;
  
  User({
    required this.accessToken,
    this.refreshToken,
    this.csrf,
    this.username,
    this.avatar,
    this.expiryTime,
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
  }) {
    return User(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      csrf: csrf ?? this.csrf,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      expiryTime: expiryTime ?? this.expiryTime,
    );
  }
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String?,
      csrf: json['csrf'] as String?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      expiryTime: json['expiry_time'] != null 
          ? DateTime.parse(json['expiry_time'] as String) 
          : null,
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
    };
  }
  
  // 创建一个空用户
  factory User.empty() {
    return User(accessToken: '');
  }
}

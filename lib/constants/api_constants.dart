class ApiConstants {
  // API基础URL
  static const String baseUrl = 'https://api.bilibili.com';
  
  // 登录相关
  static const String qrCodeUrl = 'https://passport.bilibili.com/x/passport-tv-login/qrcode/auth_code';
  static const String qrCodePollUrl = 'https://passport.bilibili.com/x/passport-tv-login/qrcode/poll';
  
  // 硬核会员相关
  static const String categoryUrl = '$baseUrl/x/senior/v1/category';
  static const String captchaUrl = '$baseUrl/x/senior/v1/captcha';
  static const String captchaSubmitUrl = '$baseUrl/x/senior/v1/captcha/submit';
  static const String questionUrl = '$baseUrl/x/senior/v1/question';
  static const String answerSubmitUrl = '$baseUrl/x/senior/v1/answer/submit';
  static const String questionResultUrl = '$baseUrl/x/senior/v1/answer/result';
  
  // API配置
  static const String appKey = '783bbb7264451d82';
  static const String appSecret = '2653583c8873dea268ab9386918b1d65';
  static const String userAgent = 'Mozilla/5.0 BiliDroid/1.12.0 (bbcallen@gmail.com)';
}

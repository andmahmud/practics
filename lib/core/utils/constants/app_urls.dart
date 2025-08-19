class AppUrls {
  AppUrls._();

  static const String _baseUrl = 'http://172.252.13.75:7777/api/v1';
  static const String login = '$_baseUrl/auth/login/';
  static const String register = '$_baseUrl/auth/register/';
  static const String verifyotp = '$_baseUrl/auth/verify-otp/';
  static const String resentotp = '$_baseUrl/auth/resend-otp/';

  static const String forgetPassword = '$_baseUrl/auth/forgot-password/';
  static const String forgetverifyotp = '$_baseUrl/auth/validate-otp/';
}

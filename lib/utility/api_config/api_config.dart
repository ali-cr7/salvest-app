import 'dart:io';

class APIConfig {
  static String baseUrl =
      Platform.isAndroid ? 'http://10.0.2.2:8000/' : 'http://127.0.0.1:8000/';

  //  192.168.1.5
  static const String signUpEndpoint = 'api/signup';
  static const String logInEndpoint = 'api/login';
  static const String sendVerificationCode = 'api/send_verification_code';
  static const String verifyCode = 'api/verify_code';
  static const String resetPassword = 'api/reset_password';
  static const String sendPropertyForSale = 'api/create_properties';
}

import 'package:intent_launcher/intent_launcher.dart';

class LoginIntent implements NavigationIntent {
  static String path = "/login";
}

class PasswordScreenIntent implements NavigationIntent {
  static String path = "/password";
  final String phoneNumber;

  PasswordScreenIntent({required this.phoneNumber});
}

class RegisterIntent implements NavigationIntent {
  static String path = "/register";
  final String phoneNumber;

  RegisterIntent({required this.phoneNumber});
}

class PhoneNumberIntent implements NavigationIntent {
  static String path = "/phone_number";
  final bool isRegister;

  PhoneNumberIntent(this.isRegister);
}

class OtpCodeIntent implements NavigationIntent {
  static String path = "/otp_code";
  final String phoneNumber;
  final bool isRegister;

  OtpCodeIntent({required this.phoneNumber, required this.isRegister});
}

class ForgotPasswordIntent implements NavigationIntent {
  static String path = "/forgot_password";
  final String phoneNumber;

  ForgotPasswordIntent({required this.phoneNumber});
}

import 'package:intent_launcher/intent_launcher.dart';

class LoginIntent implements NavigationIntent {
  static String path = "/login";
}

class PasswordScreenIntent implements NavigationIntent {
  static String path = "/password";
  String phoneNumber;

  PasswordScreenIntent({required this.phoneNumber});
}

class RegisterIntent implements NavigationIntent {
  static String path = "/register";
}

class PhoneNumberIntent implements NavigationIntent {
  static String path = "/phone_number";
  bool isRegister;

  PhoneNumberIntent(this.isRegister);
}

class OtpCodeIntent implements NavigationIntent {
  static String path = "/otp_code";
  String phoneNumber;
  bool isRegister;

  OtpCodeIntent({required this.phoneNumber, required this.isRegister});
}

class CreateNewPasswordIntent implements NavigationIntent {
  static String path = "/create_new_password";
}

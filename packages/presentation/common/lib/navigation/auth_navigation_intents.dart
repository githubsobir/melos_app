import 'package:intent_launcher/intent_launcher.dart';

class LoginIntent implements NavigationIntent {
  static String path = "/login";
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
}

class CreateNewPasswordIntent implements NavigationIntent {
  static String path = "/create_new_password";
}

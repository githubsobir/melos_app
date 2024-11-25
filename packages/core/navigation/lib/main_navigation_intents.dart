import 'package:intent_launcher/intent_launcher.dart';

class MainIntent implements NavigationIntent {
  static String path = "/main";
}

class CreateUserScreenIntent implements NavigationIntent {
  static String path = "/createUser";
}

class EditUserScreenIntent implements NavigationIntent {
  static String path = "/editUser";
  num id;

  EditUserScreenIntent(this.id);
}

class CreateTemplateScreenIntent implements NavigationIntent {
  static String path = "/createTemplate";
}

class CreateHistoryIntent implements NavigationIntent {
  static String path = "/createHistory";
}

class EditTemplateIntent implements NavigationIntent {
  num id;
  String language;
  String name;
  String message;
  String status;

  EditTemplateIntent(
      this.id, this.language, this.name, this.message, this.status);

  static String path = "/editTemplate";
}

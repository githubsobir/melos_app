import 'package:domain/model/profile/user_information_model.dart';
import 'package:intent_launcher/intent_launcher.dart';

class EditProfileIntent implements NavigationIntent {
  static String path = "/edit_profile";
  final UserInformationModel info;

  EditProfileIntent(this.info);
}

class CheckScreenIntent implements NavigationIntent {
  static String path = "/CheckScreen";
}

class ReportsScreenIntent implements NavigationIntent {
  static String path = "/ReportsScreen";
}

class WithdrawingMoneyScreenIntent implements NavigationIntent {
  static String path = "/WithdrawingMoneyScreen";
}

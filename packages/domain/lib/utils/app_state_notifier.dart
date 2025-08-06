import 'package:flutter/cupertino.dart';

abstract class AppStateNotifier {
  ValueNotifier<String?> languageCode;
  ValueNotifier<bool?> isNightMode;

  AppStateNotifier(this.languageCode, this.isNightMode);

  void setThemeValue({required bool isNightMode});

  void setLanguageValue({required String languageCode});
}

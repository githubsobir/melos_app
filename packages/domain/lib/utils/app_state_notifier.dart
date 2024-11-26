import 'package:flutter/cupertino.dart';

abstract class AppStateNotifier {
  ValueNotifier<String?> languageCode;
  ValueNotifier<bool?> isNightMode;


  AppStateNotifier(this.languageCode, this.isNightMode);

  void setValue({String? languageCode, bool? isNightMode});
}

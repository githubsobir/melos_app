import 'package:domain/utils/app_state_notifier.dart';
import 'package:flutter/cupertino.dart';

class AppStateNotifierImpl extends AppStateNotifier {
  AppStateNotifierImpl()
      : super(ValueNotifier<String?>(null), ValueNotifier<bool?>(null));

  @override
  void setValue({String? languageCode, bool? isNightMode}) {
    this.languageCode.value = languageCode;
    this.isNightMode.value = isNightMode;
  }
}

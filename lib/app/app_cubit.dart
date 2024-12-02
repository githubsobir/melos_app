import 'package:data/utils/my_shared_pref.dart';
import 'package:domain/utils/app_state_notifier.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppStateNotifier appStateNotifier;
  MySharedPref sharedPref;

  AppCubit(this.appStateNotifier, this.sharedPref)
      : super(const AppState(languageCode: "ru", themeMode: ThemeMode.system)) {
    _changeState();
    appStateNotifier.languageCode.addListener(
      () {
        _changeState(languageCode: appStateNotifier.languageCode.value);
      },
    );
    appStateNotifier.isNightMode.addListener(
      () {
        _changeState(
          themeMode: (appStateNotifier.isNightMode.value ?? false)
              ? ThemeMode.dark
              : ThemeMode.light,
        );
      },
    );
  }

  Future<void> _changeState(
      {ThemeMode? themeMode, String? languageCode}) async {
    var sharedThemeMode = await sharedPref.getThemeMode();
    var sharedLanguageCode = await sharedPref.getLanguageCode();
    ThemeMode currentThemeMode = (themeMode == null)
        ? ThemeMode.values.firstWhere(
            (element) => element.name == sharedThemeMode,
          )
        : themeMode;
    var currentLanguageCode =
        (languageCode == null) ? sharedLanguageCode : languageCode;

    sharedPref.setLanguageCode(currentLanguageCode);
    sharedPref.setThemeMode(currentThemeMode);

    emit(
      AppState(
        languageCode: currentLanguageCode,
        // themeMode: currentThemeMode,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}

class AppState extends Equatable {
  final ThemeMode themeMode;
  final String languageCode;

  const AppState({required this.themeMode, required this.languageCode});

  @override
  // TODO: implement props
  List<Object?> get props => [languageCode, themeMode];
}

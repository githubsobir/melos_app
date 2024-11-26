import 'package:domain/utils/app_state_notifier.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppStateNotifier appStateNotifier;

  // Function({String? languageCode, bool? isNightMode})? onChangex;

  AppCubit(this.appStateNotifier)
      : super(const AppState(languageCode: "uz", themeMode: ThemeMode.dark)) {
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
    emit(
      AppState(
        languageCode: languageCode ?? "uz",
        themeMode: themeMode ?? ThemeMode.system,
      ),
    );
  }
}


class AppState extends Equatable {
  final ThemeMode themeMode;
  final String languageCode;

  const AppState({required this.themeMode,required this.languageCode});

  @override
  // TODO: implement props
  List<Object?> get props => [languageCode, themeMode];
}

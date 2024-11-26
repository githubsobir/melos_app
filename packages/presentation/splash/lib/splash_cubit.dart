import 'package:bloc/bloc.dart';
import 'package:domain/utils/app_state_notifier.dart';
import 'package:equatable/equatable.dart';

class SplashCubit extends Cubit<SplashState> {
  final AppStateNotifier _appStateNotifier;

  SplashCubit(this._appStateNotifier) : super(SplashInitial());

  setNightMode(bool isNightMode) {
    _appStateNotifier.setValue(isNightMode: isNightMode);
  }

  setLanguage(String languageCode) {
    _appStateNotifier.setValue(languageCode: languageCode);
  }
}

sealed class SplashState extends Equatable {
  const SplashState();
}

final class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}

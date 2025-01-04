import 'dart:async';
import 'package:domain/usecase/auth_usecase.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthUseCase _authUseCase;

  SplashCubit(this._authUseCase) : super(SplashInitialState());

  Future<void> openNextScreen() async {
    var hasUser = await _authUseCase.hasUser();
    if (hasUser) {
      emit(MainScreenState());
    } else {
      emit(OnBoardingScreenState());
    }
  }
}

sealed class SplashState extends Equatable {
  const SplashState();
}

final class SplashInitialState extends SplashState {
  @override
  List<Object> get props => [];
}

final class OnBoardingScreenState extends SplashState {
  @override
  List<Object> get props => [];
}

final class MainScreenState extends SplashState {
  @override
  List<Object> get props => [];
}

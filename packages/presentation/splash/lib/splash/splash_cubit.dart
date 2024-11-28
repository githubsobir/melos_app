import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialState());

  Future<void> openNextScreen() async {
    Timer(
      const Duration(seconds: 1),
      () {
        emit(NextScreenState());
      },
    );
  }
}

sealed class SplashState extends Equatable {
  const SplashState();
}

final class SplashInitialState extends SplashState {
  @override
  List<Object> get props => [];
}

final class NextScreenState extends SplashState {
  @override
  List<Object> get props => [];
}

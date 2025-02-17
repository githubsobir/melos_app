import 'dart:async';

import 'package:domain/usecase/auth_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpCodeCubit extends Cubit<OtpCodeState> {
  final AuthUseCase _authUseCase;
  Timer? timer;
  int timeValue = 120;

  OtpCodeCubit(this._authUseCase) : super(RegisterInitial());

  Future<void> sendSms({
    required String phone,
  }) async {
    timerChanger();
    if (phone.isNotEmpty) {
      var response = await _authUseCase.sendSms(
        phoneNumber: phone,
      );
      // if (response.success) {
      //   emit(SuccessfullyRegisteredState());
      // } else {
      //   emit(RegisterErrorState());
      // }
    } else {
      emit(EmptyFieldsErrorState());
    }
  }

  Future<void> timerChanger() async {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeValue >= 1) {
        emit(TimerState(seconds: --timeValue));
      } else {
        timeValue = 120;
        timer.cancel();
      }
    });
  }

  Future<void> verifySmsCode({
    required String phone,
    required String smsCode,
  }) async {
    emit(LoaderState());
    if (phone.isNotEmpty && smsCode.isNotEmpty) {
      var response = await _authUseCase.verifySmsCode(
        phoneNumber: phone,
        smsCode: smsCode,
      );
      if (response.success) {
        emit(SuccessfullyVerifiedState());
      } else {
        emit(ErrorState(message: response.exceptionBody.toString()));
      }
    } else {
      emit(EmptyFieldsErrorState());
    }
  }
}

abstract class OtpCodeState extends Equatable {
  const OtpCodeState();
}

class RegisterInitial extends OtpCodeState {
  @override
  List<Object> get props => [];
}

class LoaderState extends OtpCodeState {
  @override
  List<Object> get props => [];
}

class SuccessfullyVerifiedState extends OtpCodeState {
  @override
  List<Object> get props => [];
}

class ErrorState extends OtpCodeState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class EmptyFieldsErrorState extends OtpCodeState {
  @override
  List<Object> get props => [];
}

class TimerState extends OtpCodeState {
  final int seconds;

  const TimerState({required this.seconds});

  @override
  List<Object> get props => [seconds];
}

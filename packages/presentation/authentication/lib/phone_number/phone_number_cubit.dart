import 'package:domain/usecase/auth_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  final AuthUseCase _authUseCase;

  PhoneNumberCubit(this._authUseCase) : super(LoginInitial());

  Future<void> login({
    required String phone,
    required String password,
  }) async {
    emit(LoaderState());
    if (phone.isNotEmpty && password.isNotEmpty) {
      var response = await _authUseCase.login(
        phoneNumber: phone,
        password: password,
      );
      if (response.success) {
        emit(SuccessfullyLoginState());
      } else {
        emit(LoginErrorState());
      }
    } else {
      emit(EmptyFieldsErrorState());
    }
  }
}

abstract class PhoneNumberState extends Equatable {
  const PhoneNumberState();
}

class LoginInitial extends PhoneNumberState {
  @override
  List<Object> get props => [];
}

class LoaderState extends PhoneNumberState {
  @override
  List<Object> get props => [];
}

class SuccessfullyLoginState extends PhoneNumberState {
  @override
  List<Object> get props => [];
}

class LoginErrorState extends PhoneNumberState {
  @override
  List<Object> get props => [];
}

class EmptyFieldsErrorState extends PhoneNumberState {
  @override
  List<Object> get props => [];
}

import 'package:domain/usecase/auth_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordCubit extends Cubit<LoginState> {
  final AuthUseCase _authUseCase;

  PasswordCubit(this._authUseCase) : super(LoginInitial());

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
        await _authUseCase.sendFirebaseToken();
        emit(SuccessfullyLoginState());
      } else {
        emit(LoginErrorState(
            message: response.exceptionBody
                .toString()
                .replaceAll("non_field_errors", "")
                .replaceAll("[", "")
                .replaceAll("]", "")
                .replaceAll("'", "")
                .replaceAll("{", "")
                .replaceAll("}", "")
                .replaceAll(":", "")));
      }
    } else {
      emit(EmptyFieldsErrorState());
    }
  }
}

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoaderState extends LoginState {
  @override
  List<Object> get props => [];
}

class SuccessfullyLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class EmptyFieldsErrorState extends LoginState {
  @override
  List<Object> get props => [];
}

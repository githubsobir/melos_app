import 'package:domain/usecase/auth_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthUseCase _authUseCase;

  LoginCubit(this._authUseCase) : super(LoginInitial());

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
  @override
  List<Object> get props => [];
}

class EmptyFieldsErrorState extends LoginState {
  @override
  List<Object> get props => [];
}

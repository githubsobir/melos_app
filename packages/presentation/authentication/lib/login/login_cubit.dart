import 'package:domain/usecase/auth_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthUseCase _authUseCase;

  LoginCubit(this._authUseCase) : super(LoginInitial());

  Future<void> verifyPhone({required String phone}) async {
    emit(LoaderState());
    if (phone.isNotEmpty) {
      var response = await _authUseCase.verifyPhone(
        phoneNumber: phone,
      );
      if (response) {
        emit(HasUser());
      } else {
        emit(UserNotFound());
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

class HasUser extends LoginState {
  @override
  List<Object> get props => [];
}
class UserNotFound extends LoginState {
  @override
  List<Object> get props => [];
}

class EmptyFieldsErrorState extends LoginState {
  @override
  List<Object> get props => [];
}

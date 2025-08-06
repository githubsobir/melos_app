import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/usecase/auth_usecase.dart';
import 'package:equatable/equatable.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthUseCase _authUseCase;

  ForgotPasswordCubit(this._authUseCase) : super(ForgotPasswordInitial());

  Future<void> forgotPassword({
    required String phone,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(LoaderState());
    if (phone.isNotEmpty &&
        newPassword.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      var response = await _authUseCase.forgotPassword(
        phoneNumber: phone,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      if (response.success) {
        emit(SuccessfullyChangedState());
      } else {
        emit(ErrorState(message: response.exceptionBody.toString()));
      }
    } else {
      emit(EmptyFieldsErrorState());
    }
  }
}

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
}

final class ForgotPasswordInitial extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class LoaderState extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class SuccessfullyChangedState extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class ErrorState extends ForgotPasswordState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class EmptyFieldsErrorState extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

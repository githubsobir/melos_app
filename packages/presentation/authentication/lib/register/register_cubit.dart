import 'package:domain/usecase/auth_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthUseCase _authUseCase;

  RegisterCubit(this._authUseCase) : super(RegisterInitial());

  Future<void> register({
    required String firstName,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    required String lastName,
    required String driverLicense,
    required String middleName,
    required String passportPinfl,
  }) async {
    emit(LoaderState());
    if (firstName.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        lastName.isNotEmpty &&
        driverLicense.isNotEmpty &&
        middleName.isNotEmpty &&
        passportPinfl.isNotEmpty) {
      var response = await _authUseCase.register(
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        passportPinfl: passportPinfl,
        driverLicense: driverLicense,
        phoneNumber: phoneNumber,
        password: password,
        confirmPassword: confirmPassword,
      );
      if (response.success) {
        emit(const SuccessfullyRegisteredState());
      } else {
        emit(RegisterErrorState(response.exceptionBody.toString()));
      }
    } else {
      emit(EmptyFieldsErrorState());
    }
  }
}

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class LoaderState extends RegisterState {
  @override
  List<Object> get props => [];
}

class SuccessfullyRegisteredState extends RegisterState {
  const SuccessfullyRegisteredState();

  @override
  List<Object> get props => [];
}

class RegisterErrorState extends RegisterState {
  final String message;

  const RegisterErrorState(this.message);

  @override
  List<Object> get props => [];
}

class EmptyFieldsErrorState extends RegisterState {
  @override
  List<Object> get props => [];
}

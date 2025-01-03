import 'package:bloc/bloc.dart';
import 'package:domain/usecase/auth_usecase.dart';
import 'package:equatable/equatable.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthUseCase _authUseCase;

  RegisterCubit(this._authUseCase) : super(RegisterInitial());

  Future<void> register({
    required String firstName,
    required String phone,
    required String password,
    required String confirmPassword,
    required String lastName,
    required String driverLicense,
    required String middleName,
    required String passportPinfl,
    required String role,
  }) async {
    emit(LoaderState());
    if (firstName.isNotEmpty &&
        phone.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        lastName.isNotEmpty &&
        driverLicense.isNotEmpty &&
        middleName.isNotEmpty &&
        passportPinfl.isNotEmpty &&
        role.isNotEmpty) {
      var response = await _authUseCase.sendSms(phoneNumber: phone);
      if (response.success) {
        emit(SuccessfullyRegisteredState(
          firstName,
          phone,
          password,
          confirmPassword,
          lastName,
          driverLicense,
          middleName,
          passportPinfl,
          role,
        ));
      } else {
        emit(RegisterErrorState());
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
  final String firstName;
  final String phone;
  final String password;
  final String confirmPassword;
  final String lastName;
  final String driverLicense;
  final String middleName;
  final String passportPinfl;
  final String role;

  const SuccessfullyRegisteredState(
    this.firstName,
    this.phone,
    this.password,
    this.confirmPassword,
    this.lastName,
    this.driverLicense,
    this.middleName,
    this.passportPinfl,
    this.role,
  );

  @override
  List<Object> get props => [
        firstName,
        phone,
        password,
        confirmPassword,
        lastName,
        driverLicense,
        middleName,
        passportPinfl,
        role,
      ];
}

class RegisterErrorState extends RegisterState {
  @override
  List<Object> get props => [];
}

class EmptyFieldsErrorState extends RegisterState {
  @override
  List<Object> get props => [];
}

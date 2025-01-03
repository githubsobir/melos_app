import 'package:bloc/bloc.dart';
import 'package:domain/usecase/auth_usecase.dart';
import 'package:equatable/equatable.dart';

class OtpCodeCubit extends Cubit<OtpCodeState> {
  final AuthUseCase _authUseCase;

  OtpCodeCubit(this._authUseCase) : super(RegisterInitial());

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
    required String smsCode,
  }) async {
    emit(LoaderState());
    var response = await _authUseCase.register(
      firstName: firstName,
      phoneNumber: phone,
      password: password,
      confirmPassword: confirmPassword,
      lastName: lastName,
      driverLicense: driverLicense,
      middleName: middleName,
      passportPinfl: passportPinfl,
      role: role,
      smsCode: smsCode,
    );
    if (firstName.isNotEmpty &&
        phone.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        lastName.isNotEmpty &&
        driverLicense.isNotEmpty &&
        middleName.isNotEmpty &&
        passportPinfl.isNotEmpty &&
        role.isNotEmpty &&
        smsCode.isNotEmpty) {
      if (response.success) {
        emit(SuccessfullyRegisteredState());
      } else {
        emit(RegisterErrorState());
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

class SuccessfullyRegisteredState extends OtpCodeState {
  @override
  List<Object> get props => [];
}

class RegisterErrorState extends OtpCodeState {
  @override
  List<Object> get props => [];
}

class EmptyFieldsErrorState extends OtpCodeState {
  @override
  List<Object> get props => [];
}

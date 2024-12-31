import 'package:bloc/bloc.dart';
import 'package:domain/usecase/auth_usecase.dart';
import 'package:equatable/equatable.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthUseCase _authUseCase;

  RegisterCubit(this._authUseCase) : super(RegisterInitial());

  Future<void> register(
      {required String firstName,
      required String phone,
      required String password,
      required String confirmPassword}) async {
    emit(LoaderState());
    var response = await _authUseCase.register(
        firstName: firstName,
        phoneNumber: phone,
        password: password,
        confirmPassword: confirmPassword,
        lastName: '',
        driverLicense: "",
        middleName: "",
        passportPinfl: "",
        role: "",
        smsCode: "");
    if (response.success) {
      emit(SuccessfullyRegisteredState());
    } else {
      emit(RegisterErrorState());
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
  @override
  List<Object> get props => [];
}

class RegisterErrorState extends RegisterState {
  @override
  List<Object> get props => [];
}

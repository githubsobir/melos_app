import 'package:domain/utils/base_result.dart';

import '../repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<BaseResult<bool>> login({
    required String phoneNumber,
    required String password,
  }) {
    return _authRepository.login(
      phoneNumber: phoneNumber,
      password: password,
    );
  }

  Future<BaseResult<bool>> register({
    required String firstName,
    required String lastName,
    required String middleName,
    required String passportPinfl,
    required String driverLicense,
    required String role,
    required String smsCode,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) {
    return _authRepository.register(
      firstName: firstName,
      lastName: lastName,
      middleName: middleName,
      passportPinfl: passportPinfl,
      driverLicense: driverLicense,
      role: role,
      smsCode: smsCode,
      phoneNumber: phoneNumber,
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  Future<BaseResult<bool>> sendSms({required String phoneNumber}) {
    return _authRepository.sendSms(phoneNumber: phoneNumber);
  }
}

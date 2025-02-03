import 'package:domain/utils/base_result.dart';

abstract class AuthRepository {
  Future<BaseResult<bool>> login({
    required String phoneNumber,
    required String password,
  });

  Future<BaseResult<bool>> sendSms({
    required String phoneNumber,
  });

  Future<BaseResult<bool>> register({
    required String firstName,
    required String lastName,
    required String middleName,
    required String phoneNumber,
    required String passportPinfl,
    required String driverLicense,
    required String password,
    required String confirmPassword,
  });

  Future<bool> hasUser();

  Future<bool> logOut();

  Future<bool> verifyPhone({required String phoneNumber});

  Future<BaseResult<bool>>  verifySmsCode({required String phoneNumber, required String smsCode});
}

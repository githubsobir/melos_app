import 'package:data/models/remote/auth/request/login_request.dart';
import 'package:data/models/remote/auth/request/logout_request.dart';
import 'package:data/models/remote/auth/request/register_request.dart';
import 'package:data/models/remote/auth/request/send_sms_request.dart';
import 'package:data/models/remote/auth/response/login_response.dart';
import 'package:data/models/remote/auth/response/register_response.dart';
import 'package:data/models/remote/auth/response/send_sms_response.dart';
import 'package:data/service/auth_service.dart';
import 'package:data/utils/my_shared_pref.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/utils/base_result.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthService _authServices;

  AuthRepositoryImpl(this._authServices);

  @override
  Future<BaseResult<bool>> login(
      {required String phoneNumber, required String password}) async {
    try {
      var response = await _authServices.login(LoginRequest(
        phoneNumber: phoneNumber,
        password: password,
      ));
      var isSaved = await MySharedPref.instance.setAccessToken(
              LoginResponse.fromJson(response.data).access ?? "") &&
          await MySharedPref.instance.setRefreshToken(
              LoginResponse.fromJson(response.data).refresh ?? "");
      return BaseResult(success: true, body: isSaved);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<bool>> sendSms({required String phoneNumber}) async {
    try {
      var response =
          await _authServices.sendSms(SendSmsRequest(phoneNumber: phoneNumber));
      return BaseResult(
        success: true,
        body: SendSmsResponse.fromJson(response.data).message != null,
      );
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<bool>> register({
    required String firstName,
    required String lastName,
    required String middleName,
    required String phoneNumber,
    required String passportPinfl,
    required String driverLicense,
    required String role,
    required String smsCode,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      var response = await _authServices.register(RegisterRequest(
          firstName: firstName,
          lastName: lastName,
          middleName: middleName,
          phoneNumber: phoneNumber,
          passportPinfl: passportPinfl,
          driverLicense: driverLicense,
          role: role,
          smsCode: smsCode,
          password: password,
          confirmPassword: confirmPassword));

      var isSaved = await MySharedPref.instance.setAccessToken(
              RegisterResponse.fromJson(response.data).token?.access ?? "") &&
          await MySharedPref.instance.setRefreshToken(
              RegisterResponse.fromJson(response.data).token?.refresh ?? "");
      return BaseResult(success: true, body: isSaved);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<bool> hasUser() async {
    var hasUser = (await MySharedPref.instance.getAccessToken()).isNotEmpty &&
        (await MySharedPref.instance.getRefreshToken()).isNotEmpty;
    return hasUser;
  }

  @override
  Future<bool> logOut() async {
    try {
      var refresh = await MySharedPref.instance.getRefreshToken();
      var response =
          await _authServices.logOut(LogoutRequest(refresh: refresh));

      if (response.statusCode == 205) {
        return await MySharedPref.instance.clearAllData();
      }
      return false;
    } catch (exception) {
      return false;
    }
  }

  @override
  Future<bool> verifyPhone({required String phoneNumber}) async {
    try {
      var response = await _authServices
          .verifyPhone(SendSmsRequest(phoneNumber: phoneNumber));
      return true;
    } catch (exception) {
      return false;
    }
  }
}

import 'package:data/models/remote/auth/request/forgot_password_request.dart';
import 'package:data/models/remote/auth/request/login_request.dart';
import 'package:data/models/remote/auth/request/logout_request.dart';
import 'package:data/models/remote/auth/request/register_request.dart';
import 'package:data/models/remote/auth/request/send_sms_request.dart';
import 'package:data/models/remote/auth/request/verify_sms_code_request.dart';
import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';

class AuthService {
  final NetBase _netBase;

  AuthService(this._netBase);

  Future<Response> login(LoginRequest request) async {
    var response = await _netBase.dio.post(
      'auth/login/',
      data: request.toJson(),
    );
    return response;
  }

  Future<Response> sendSms(SendSmsRequest request) async {
    var response = await _netBase.dio.post(
      'auth/send-sms/',
      data: request.toJson(),
    );
    return response;
  }

  Future<Response> verifySms(VerifySmsCodeRequest request) async {
    var response = await _netBase.dio.post(
      'auth/verify-send-sms/',
      data: request.toJson(),
    );
    return response;
  }

  Future<Response> register(RegisterRequest request) async {
    var response = await _netBase.dio.post(
      'auth/register/',
      data: request.toJson(),
    );
    return response;
  }

  Future<Response> logOut(LogoutRequest request) async {
    var response = await _netBase.dio.post(
      'auth/logout/',
      data: request.toJson(),
    );
    return response;
  }

  Future<Response> verifyPhone(SendSmsRequest sendSmsRequest) async {
    var response = await _netBase.dio.get(
      'auth/verify-phone/${sendSmsRequest.phoneNumber}/',
    );
    return response;
  }

  Future<Response> verifySmsCode(
      VerifySmsCodeRequest verifySmsCodeRequest) async {
    var response = await _netBase.dio.post(
      'auth/verify-sms-code/',
      data: verifySmsCodeRequest.toJson(),
    );
    return response;
  }

  Future<Response> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    var response = await _netBase.dio.post(
      'auth/password-reset/',
      data: forgotPasswordRequest.toJson(),
    );
    return response;
  }
}

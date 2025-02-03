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
      'users/login/',
      data: request.toJson(),
    );
    return response;
  }

  Future<Response> sendSms(SendSmsRequest request) async {
    var response = await _netBase.dio.post(
      'users/send-sms/',
      data: request.toJson(),
    );
    return response;
  }

  Future<Response> verifySms(VerifySmsCodeRequest request) async {
    var response = await _netBase.dio.post(
      'users/verify-send-sms/',
      data: request.toJson(),
    );
    return response;
  }

  Future<Response> register(RegisterRequest request) async {
    var response = await _netBase.dio.post(
      'users/register/',
      data: request.toJson(),
    );
    return response;
  }

  Future<Response> logOut(LogoutRequest request) async {
    var response = await _netBase.dio.post(
      'users/logout/',
      data: request.toJson(),
    );
    return response;
  }

  Future<Response> verifyPhone(SendSmsRequest sendSmsRequest) async {
    var response = await _netBase.dio.get(
      'users/verify-phone/${sendSmsRequest.phoneNumber}/',
    );
    return response;
  }

  Future<Response> verifySmsCode(
      VerifySmsCodeRequest verifySmsCodeRequest) async {
    var response = await _netBase.dio.post(
      'users/verify-sms-code/',
      data: verifySmsCodeRequest.toJson(),
    );
    return response;
  }
}

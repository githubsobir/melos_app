import 'package:data/models/remote/auth/request/login_request.dart';
import 'package:data/models/remote/auth/request/logout_request.dart';
import 'package:data/models/remote/auth/request/register_request.dart';
import 'package:data/models/remote/auth/request/send_sms_request.dart';
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
}

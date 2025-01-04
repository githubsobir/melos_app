import 'package:data/models/remote/auth/request/login_request.dart';
import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';

class CarsService {
  final NetBase _netBase;

  CarsService(this._netBase);

  Future<Response> login(LoginRequest request) async {
    var response = await _netBase.dio.post(
      'users/login/',
      data: request.toJson(),
    );
    return response;
  }

  Future<Response> carsList() async {
    var response = await _netBase.dio.get('cars/list/');
    return response;
  }
}

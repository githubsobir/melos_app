import 'package:data/models/remote/auth/request/fcm_register_register_request.dart';
import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';

class MainService {
  final NetBase _netBase;

  MainService(this._netBase);

  Future<Response> getNotifications() async {
    var response = await _netBase.dio.get(
      'notification/list/',
    );
    return response;
  }

  Future<Response> readNotification({
    required num id,
    required FcmRegisterRegisterRequest request,
  }) async {
    var response = await _netBase.dio.get(
      'notification/detail/$id/',
      data: request.toJson(),
    );
    return response;
  }
}

import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';

class MainService {
  final NetBase _netBase;

  MainService(this._netBase);

  Future<Response> getNotifications() async {
    var response = await _netBase.dio.get(
      'users/notifications/',
    );
    return response;
  }
}

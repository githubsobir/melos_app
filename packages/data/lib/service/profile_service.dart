import 'package:data/models/remote/profile/request/profile_update_request.dart';
import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';

class ProfileService {
  final NetBase _netBase;

  ProfileService(this._netBase);

  Future<Response> updateUser({required ProfileUpdateRequest request}) async {
    var response = await _netBase.dio.put(
      'users/update/',
      data: request.toJson(),
    );
    return response;
  }
}

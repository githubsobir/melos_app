import 'package:data/models/remote/profile/request/profile_update_request.dart';
import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';

class ProfileService {
  final NetBase _netBase;

  ProfileService(this._netBase);

  Future<Response> updateUser({required ProfileUpdateRequest request}) async {
    var response = await _netBase.dio.put(
      'user/update/',
      data: request.toJson(),
    );
    return response;
  }

  Future<Response> userInformation() async {
    var response = await _netBase.dio.get(
      'user/profile/',
    );
    return response;
  }

  Future<Response> uploadImage(String path) async {
    var image = await MultipartFile.fromFile(path,
        filename: path.substring(path.lastIndexOf("/") + 1));
    var formData = FormData.fromMap({
      "photo": image,
    });
    var response = await _netBase.dio.post(
      "user/image-upload/",
      data: formData,
    );
    return response;
  }

  Future<Response> unreadNotification() async {
    var response = await _netBase.dio.get(
      'notification/unread/count/',
    );
    return response;
  }

  Future<Response> checkInvoice() async {
    var response = await _netBase.dio.get(
      'payments/invoice/list/',
    );
    return response;
  }

  Future<Response> withdraw({required String amount}) async {
    var response =
        await _netBase.dio.post('payments/withdraw/', data: {"amount": amount});
    return response;
  }

  Future<Response> balance() async {
    var response = await _netBase.dio.get(
      'payments/withdraw/',
    );
    return response;
  }
}

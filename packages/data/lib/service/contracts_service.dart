import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';

class ContractsService {
  final NetBase _netBase;

  ContractsService(this._netBase);

  Future<Response> contractsInfo({required num bookingId}) async {
    var response = await _netBase.dio.get(
      'contracts/client/$bookingId/',
    );
    return response;
  }

  Future<Response> uploadContract({required num bookingId, required String path}) async {
    var image = await MultipartFile.fromFile(path,
        filename: path.substring(path.lastIndexOf("/") + 1));
    var formData = FormData.fromMap({
      "booking_id": bookingId,
      "client_document": image,
    });
    var response = await _netBase.dio.post(
      "contracts/upload/client/",
      data: formData,
    );
    return response;
  }
}

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
}

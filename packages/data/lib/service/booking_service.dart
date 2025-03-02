import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';

class BookingService {
  final NetBase _netBase;

  BookingService(this._netBase);

  Future<Response> bookingHistory() async {
    var response = await _netBase.dio.get(
      'booking/history/',
    );
    return response;
  }

  Future<Response> bookingList() async {
    var response = await _netBase.dio.get(
      'booking/list/',
    );
    return response;
  }
}

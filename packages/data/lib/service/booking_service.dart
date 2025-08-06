import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';

class BookingService {
  final NetBase _netBase;

  BookingService(this._netBase);

  Future<Response> bookingHistory() async {
    var response = await _netBase.dio.get(
      'booking/list/',
    );
    return response;
  }

  Future<Response> bookingList() async {
    var response = await _netBase.dio.get('booking/list/');
    return response;
  }

  Future<Response> bookingCurrent() async {
    var response = await _netBase.dio.get(
      'booking/current/',
    );
    return response;
  }

  Future<Response> finishBooking({required num bookingId}) async {
    var response = await _netBase.dio.put(
      'booking/finish/client/$bookingId/',
    );
    return response;
  }

  Future<Response> createReview(
      {required num bookingId,
      required int rating,
      required String comment}) async {
    var response = await _netBase.dio.post('review/create/', data: {
      "booking_id": bookingId,
      "rating": rating,
      "comment": comment,
    });
    return response;
  }

  Future<Response> cancelBooking({required num bookingId}) async {
    var response = await _netBase.dio.post(
      'booking/cancel/$bookingId/',
    );
    return response;
  }
}

import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';

class PaymentService {
  final NetBase _netBase;

  PaymentService(this._netBase);

  Future<Response> paymentProcess(
      {required int carId,
      required String startDateTme,
      required String endDateTme}) async {
    var response = await _netBase.dio.get(
      'payments/process/$carId/?start_date_time=$startDateTme&end_date_time=$endDateTme',
    );
    return response;
  }
}

import 'package:data/models/remote/payment/request/send_invoice_request.dart';
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

  Future<Response> sendInvoice(SendInvoiceRequest sendInvoiceRequest) async {
    var response = await _netBase.dio
        .post('payments/send-invoice/', data: sendInvoiceRequest.toJson());
    return response;
  }

  Future<Response> paymentStatus({required num paymentId}) async {
    var response = await _netBase.dio.get('payments/status/$paymentId/');
    return response;
  }
}

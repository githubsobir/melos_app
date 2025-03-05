import 'package:domain/model/payment/payment_process_model.dart';
import 'package:domain/model/payment/payment_status_model.dart';
import 'package:domain/model/payment/send_invoice_model.dart';
import 'package:domain/utils/base_result.dart';

abstract class PaymentRepository {
  Future<BaseResult<PaymentProcessModel>> paymentProcess({
    required int carId,
    required String startDateTme,
    required String endDateTme,
  });

  Future<BaseResult<InvoiceModel>> sendInvoice({
    required num carId,
    required num amount,
    required String paymentMethod,
    required String startDateTme,
    required String endDateTme,
  });

  Future<BaseResult<PaymentStatusModel>> paymentStatus({required num paymentId});
}

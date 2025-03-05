import 'package:domain/model/payment/payment_process_model.dart';
import 'package:domain/model/payment/send_invoice_model.dart';
import 'package:domain/repository/payment_repository.dart';
import 'package:domain/utils/base_result.dart';

class PaymentUseCase {
  final PaymentRepository _paymentRepository;

  PaymentUseCase(this._paymentRepository);

  Future<BaseResult<PaymentProcessModel>> paymentProcess({
    required int carId,
    required String startDateTme,
    required String endDateTme,
  }) {
    return _paymentRepository.paymentProcess(
      carId: carId,
      startDateTme: startDateTme,
      endDateTme: endDateTme,
    );
  }

  Future<BaseResult<SendInvoiceModel>> sendInvoice({
    required num carId,
    required num amount,
    required String paymentMethod,
    required String startDateTme,
    required String endDateTme,
  }) {
    return _paymentRepository.sendInvoice(
      carId: carId,
      amount: amount,
      paymentMethod: paymentMethod,
      startDateTme: startDateTme,
      endDateTme: endDateTme,
    );
  }
}

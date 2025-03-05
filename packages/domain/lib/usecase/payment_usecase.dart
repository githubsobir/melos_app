import 'package:domain/model/payment/payment_process_model.dart';
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
}

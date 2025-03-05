import 'package:domain/model/payment/payment_process_model.dart';
import 'package:domain/utils/base_result.dart';

abstract class PaymentRepository {
  Future<BaseResult<PaymentProcessModel>> paymentProcess({
    required int carId,
    required String startDateTme,
    required String endDateTme,
  });
}

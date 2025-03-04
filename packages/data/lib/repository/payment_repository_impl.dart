import 'package:data/service/payment_service.dart';
import 'package:domain/repository/payment_repository.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  final PaymentService _paymentService;

  PaymentRepositoryImpl(this._paymentService);
}

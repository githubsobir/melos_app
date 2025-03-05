import 'package:data/models/remote/payment/payment_process_response.dart';
import 'package:data/service/payment_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/payment/payment_process_model.dart';
import 'package:domain/repository/payment_repository.dart';
import 'package:domain/utils/base_result.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  final PaymentService _paymentService;

  PaymentRepositoryImpl(this._paymentService);

  @override
  Future<BaseResult<PaymentProcessModel>> paymentProcess({
    required int carId,
    required String startDateTme,
    required String endDateTme,
  }) async {
    try {
      var response = await _paymentService.paymentProcess(
        carId: carId,
        startDateTme: startDateTme,
        endDateTme: endDateTme,
      );
      return BaseResult(
        success: true,
        body: PaymentProcessResponse.fromJson(response.data).toDomainModel(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }
}

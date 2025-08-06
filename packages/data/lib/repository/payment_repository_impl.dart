import 'dart:convert';
import 'dart:developer';

import 'package:data/models/remote/payment/request/send_invoice_request.dart';
import 'package:data/models/remote/payment/response/payment_process_response.dart';
import 'package:data/models/remote/payment/response/payment_status_response.dart';
import 'package:data/models/remote/payment/response/send_invoice_response.dart';
import 'package:data/service/payment_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/payment/payment_process_model.dart';
import 'package:domain/model/payment/payment_status_model.dart';
import 'package:domain/model/payment/send_invoice_model.dart';
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

  @override
  Future<BaseResult<InvoiceModel>> sendInvoice({
    required num carId,
    required String amount,
    required String paymentMethod,
    required String startDateTme,
    required String endDateTme,
  }) async {
    try {
      var response = await _paymentService.sendInvoice(SendInvoiceRequest(
        carId: carId,
        amount: amount,
        paymentMethod: paymentMethod,
        startDateTime: startDateTme,
        endDateTime: endDateTme,
      ));
      return BaseResult(
        success: true,
        body: InvoiceResponse.fromJson(response.data).toDomainModel(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<PaymentStatusModel>> paymentStatus(
      {required num paymentId}) async {
    try {
      var response = await _paymentService.paymentStatus(
        paymentId: paymentId,
      );

      return BaseResult(
        success: true,
        body: PaymentStatusResponse.fromJson(response.data).toDomainModel(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<String>> getHtml() async {
    try {
      var response = await _paymentService.getHtml();
      return BaseResult(success: true, body: response.toString());
    } catch (e) {
      return BaseResult(success: false, body: e.toString());
    }
  }
}

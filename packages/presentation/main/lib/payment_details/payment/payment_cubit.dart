import 'dart:async';

import 'package:common/widgets/custom_functions.dart';
import 'package:domain/model/payment/payment_status_model.dart';
import 'package:domain/usecase/payment_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentUseCase _paymentUseCase;
  Timer? timer;

  PaymentCubit(this._paymentUseCase)
      : super(PaymentState(status: PaymentStatusModel()));

  Future<void> checkStatus(num paymentId) async {
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        paymentStatus(paymentId: paymentId);
      },
    );
  }

  Future<void> paymentStatus({
    required num paymentId,
  }) async {
    var response = await _paymentUseCase.paymentStatus(
      paymentId: paymentId,
    );
    if (response.success) {
      var invoice = response.body;
      if (invoice != null) {
        if (invoice.status == 1) {
          emit(state.copyWith(status: invoice));
          timer?.cancel();
        } else if (invoice.status == 0) {
          emit(state.copyWith(
              status: PaymentStatusModel(status: 0, bookingId: 0)));
        } else {
          emit(state.copyWith(
              status: PaymentStatusModel(status: -1, bookingId: -1)));
          showToastSms(
              "To'lov amalga oshmadi,\nTo'lov kutish xolatidan chiqarildi");
          timer?.cancel();
        }
      }
    }
  }
}

class PaymentState extends Equatable {
  final PaymentStatusModel status;

  const PaymentState({required this.status});

  PaymentState copyWith({
    PaymentStatusModel? status,
  }) {
    return PaymentState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}

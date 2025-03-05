import 'package:domain/model/payment/payment_process_model.dart';
import 'package:domain/usecase/payment_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentDetailCubit extends Cubit<PaymentDetailState> {
  final PaymentUseCase _paymentUseCase;

  PaymentDetailCubit(this._paymentUseCase)
      : super(PaymentDetailState(
          selectedMethod: 0,
          firstAgreement: false,
          secondAgreement: false,
          cardNumber: "",
          cardDate: "",
          paymentProcessModel: PaymentProcessModel(),
        ));

  Future<void> paymentProcess({
    required int carId,
    required String startDateTme,
    required String endDateTme,
  }) async {
    var response = await _paymentUseCase.paymentProcess(
        carId: carId, startDateTme: startDateTme, endDateTme: endDateTme);
    if (response.success) {
      var info = response.body;
      if (info != null) {
        emit(state.copyWith());
      }
    }
  }

  Future<void> selectPaymentMethod(int selectedMethod) async {
    emit(state.copyWith(selectedMethod: selectedMethod));
  }

  Future<void> setFirstAgreement(bool firstAgreement) async {
    emit(state.copyWith(firstAgreement: firstAgreement));
  }

  Future<void> setSecondAgreement(bool secondAgreement) async {
    emit(state.copyWith(secondAgreement: secondAgreement));
  }

  Future<void> setCardNumber(String cardNumber) async {
    emit(state.copyWith(cardNumber: cardNumber));
  }

  Future<void> setCardDate(String cardDate) async {
    emit(state.copyWith(cardDate: cardDate));
  }
}

class PaymentDetailState extends Equatable {
  final List<int> paymentMethods = [0, 1, 2];
  final int selectedMethod;
  final bool firstAgreement;
  final bool secondAgreement;
  final String cardNumber;
  final String cardDate;
  final PaymentProcessModel paymentProcessModel;

  PaymentDetailState({
    required this.selectedMethod,
    required this.firstAgreement,
    required this.secondAgreement,
    required this.cardNumber,
    required this.cardDate,
    required this.paymentProcessModel,
  });

  PaymentDetailState copyWith(
      {int? selectedMethod,
      bool? firstAgreement,
      bool? secondAgreement,
      String? cardNumber,
      String? cardDate,
      PaymentProcessModel? paymentProcessModel}) {
    return PaymentDetailState(
      selectedMethod: selectedMethod ?? this.selectedMethod,
      firstAgreement: firstAgreement ?? this.firstAgreement,
      secondAgreement: secondAgreement ?? this.secondAgreement,
      cardNumber: cardNumber ?? this.cardNumber,
      cardDate: cardDate ?? this.cardDate,
      paymentProcessModel: paymentProcessModel ?? this.paymentProcessModel,
    );
  }

  @override
  List<Object?> get props => [
        paymentMethods,
        selectedMethod,
        firstAgreement,
        secondAgreement,
        cardNumber,
        cardDate,
        paymentProcessModel,
      ];
}

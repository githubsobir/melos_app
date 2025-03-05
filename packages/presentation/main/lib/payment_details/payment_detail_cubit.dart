import 'package:domain/model/payment/payment_process_model.dart';
import 'package:domain/model/payment/send_invoice_model.dart';
import 'package:domain/usecase/payment_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentDetailCubit extends Cubit<PaymentDetailState> {
  final PaymentUseCase _paymentUseCase;

  PaymentDetailCubit(this._paymentUseCase)
      : super(PaymentDetailState(
          selectedMethod: "Payme",
          firstAgreement: false,
          secondAgreement: false,
          cardNumber: "",
          cardDate: "",
          paymentProcessModel: PaymentProcessModel(),
          invoice: InvoiceModel(),
          isButtonLoading: false,
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
        print("info ${info.photo}");
        emit(state.copyWith(paymentProcessModel: info));
      }
    }
  }

  Future<void> sendInvoice({
    required num amount,
    required num carId,
    required String paymentMethod,
    required String startDateTme,
    required String endDateTme,
  }) async {
    emit(state.copyWith(isButtonLoading: true));
    var response = await _paymentUseCase.sendInvoice(
      carId: carId,
      amount: amount,
      paymentMethod: paymentMethod,
      startDateTme: startDateTme,
      endDateTme: endDateTme,
    );
    if (response.success) {
      var invoice = response.body;
      if (invoice != null) {
        emit(state.copyWith(invoice: invoice,isButtonLoading: false));
      }else{
        emit(state.copyWith(isButtonLoading: false));
      }
    }else{
      emit(state.copyWith(isButtonLoading: false));
    }
  }

  Future<void> selectPaymentMethod(String selectedMethod) async {
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
  final List<String> paymentMethods = ["Payme", "Click"];
  final String selectedMethod;
  final bool isButtonLoading;
  final bool firstAgreement;
  final bool secondAgreement;
  final String cardNumber;
  final String cardDate;
  final PaymentProcessModel paymentProcessModel;
  final InvoiceModel invoice;

  PaymentDetailState({
    required this.selectedMethod,
    required this.firstAgreement,
    required this.secondAgreement,
    required this.cardNumber,
    required this.cardDate,
    required this.paymentProcessModel,
    required this.invoice,
    required this.isButtonLoading,
  });

  PaymentDetailState copyWith(
      {String? selectedMethod,
      bool? firstAgreement,
      bool? secondAgreement,
      String? cardNumber,
      String? cardDate,
      PaymentProcessModel? paymentProcessModel,
      InvoiceModel? invoice,
      bool? isButtonLoading}) {
    return PaymentDetailState(
      selectedMethod: selectedMethod ?? this.selectedMethod,
      firstAgreement: firstAgreement ?? this.firstAgreement,
      secondAgreement: secondAgreement ?? this.secondAgreement,
      cardNumber: cardNumber ?? this.cardNumber,
      cardDate: cardDate ?? this.cardDate,
      paymentProcessModel: paymentProcessModel ?? this.paymentProcessModel,
      invoice: invoice ?? this.invoice,
      isButtonLoading: isButtonLoading ?? this.isButtonLoading,
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
        invoice,
        isButtonLoading
      ];
}

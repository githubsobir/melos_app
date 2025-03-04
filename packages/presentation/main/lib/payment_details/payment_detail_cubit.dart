import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class PaymentDetailCubit extends Cubit<PaymentDetailState> {
  PaymentDetailCubit()
      : super(PaymentDetailState(
          selectedMethod: 0,
          firstAgreement: false,
          secondAgreement: false,
        ));

  Future<void> selectPaymentMethod(int selectedMethod) async {
    emit(state.copyWith(selectedMethod: selectedMethod));
  }

  Future<void> setFirstAgreement(bool firstAgreement) async {
    emit(state.copyWith(firstAgreement: firstAgreement));
  }

  Future<void> setSecondAgreement(bool secondAgreement) async {
    emit(state.copyWith(secondAgreement: secondAgreement));
  }
}

class PaymentDetailState extends Equatable {
  final List<int> paymentMethods = [0, 1, 2];
  final int selectedMethod;
  final bool firstAgreement;
  final bool secondAgreement;

  PaymentDetailState({
    required this.selectedMethod,
    required this.firstAgreement,
    required this.secondAgreement,
  });

  PaymentDetailState copyWith(
      {int? selectedMethod, bool? firstAgreement, bool? secondAgreement}) {
    return PaymentDetailState(
      selectedMethod: selectedMethod ?? this.selectedMethod,
      firstAgreement: firstAgreement ?? this.firstAgreement,
      secondAgreement: secondAgreement ?? this.secondAgreement,
    );
  }

  @override
  List<Object?> get props => [paymentMethods, selectedMethod,firstAgreement,secondAgreement];
}

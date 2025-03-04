import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(const PaymentState(isPayed: false));

  Future<void> pay() async {
    Timer(
      const Duration(seconds: 5),
      () {
        emit(const PaymentState(isPayed: true));
      },
    );
  }
}

class PaymentState extends Equatable {
  final bool isPayed;

  const PaymentState({required this.isPayed});

  @override
  List<Object?> get props => [isPayed];
}

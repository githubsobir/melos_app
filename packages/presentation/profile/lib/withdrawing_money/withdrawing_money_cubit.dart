import 'package:bloc/bloc.dart';
import 'package:domain/model/profile/balance_model.dart';
import 'package:domain/usecase/profile_usecase.dart';
import 'package:equatable/equatable.dart';

class WithdrawingMoneyCubit extends Cubit<WithdrawingMoneyState> {
  final ProfileUseCase _profileUseCase;

  WithdrawingMoneyCubit(this._profileUseCase)
      : super(WithdrawingMoneyInitial());

  Future<void> balance() async {
    emit(LoaderState());
    var response = await _profileUseCase.balance();
    if (response.success) {
      var info = response.body;
      if (info != null) {
        emit(BalanceState(info));
      }
    }
  }

  Future<void> withdraw({
    required String amount,
  }) async {
    emit(LoaderState());
    var response = await _profileUseCase.withdraw(
      amount: amount,
    );
    if (response.success) {
      emit(WithdrawMoneyState());
    } else {
      emit(WithdrawMoneyErrorState(response.exceptionBody.toString()));
    }
  }
}

sealed class WithdrawingMoneyState extends Equatable {
  const WithdrawingMoneyState();
}

final class WithdrawingMoneyInitial extends WithdrawingMoneyState {
  @override
  List<Object> get props => [];
}

final class LoaderState extends WithdrawingMoneyState {
  @override
  List<Object> get props => [];
}

final class BalanceState extends WithdrawingMoneyState {
  final BalanceModel balance;

  const BalanceState(this.balance);

  @override
  List<Object?> get props => [balance];
}

final class WithdrawMoneyState extends WithdrawingMoneyState {
  @override
  List<Object?> get props => [];
}

final class WithdrawMoneyErrorState extends WithdrawingMoneyState {
  String message;

  WithdrawMoneyErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

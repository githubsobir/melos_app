import 'package:bloc/bloc.dart';
import 'package:domain/model/profile/check_model.dart';
import 'package:domain/usecase/profile_usecase.dart';
import 'package:equatable/equatable.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit(this._profileUseCase) : super(CheckInitial());
  final ProfileUseCase _profileUseCase;

  Future<void> checkInvoice() async {
    emit(LoaderState());
    var response = await _profileUseCase.checkInvoice();
    if (response.success) {
      var info = response.body;
      if (info != null) {
        emit(CheckInfoState(info));
      }
    }
  }
}

sealed class CheckState extends Equatable {
  const CheckState();
}

final class LoaderState extends CheckState {
  @override
  List<Object> get props => [];
}

final class CheckInitial extends CheckState {
  @override
  List<Object> get props => [];
}

class CheckInfoState extends CheckState {
  final CheckModel info;

  const CheckInfoState(this.info);

  @override
  List<Object> get props => [info];
}

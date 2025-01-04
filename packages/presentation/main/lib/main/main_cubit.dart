import 'package:domain/usecase/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  final AuthUseCase _authUseCase;

  MainCubit(this._authUseCase) : super(MainInitial());

  var pageIndex = 0;

  changeMenuPosition(int index) {
    pageIndex = index;
    emit(MenuPositionState(index));
  }

  logOut() async {
    var logOut = await _authUseCase.logOut();
    if (logOut) {
      emit(LogOutState());
    }
  }
}

abstract class MainState {}

class MainInitial extends MainState {}

class LogOutState extends MainState {}

class MenuPositionState extends MainState {
  final int menuPosition;

  MenuPositionState(this.menuPosition);
}

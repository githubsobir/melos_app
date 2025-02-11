import 'package:domain/usecase/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this._authUseCase) : super(MenuPositionState(0));

  final AuthUseCase _authUseCase;
  var pageIndex = 0;
  bool hasUser = false;

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

  Future<void> hasUserProfile() async {
    hasUser = await _authUseCase.hasUser();
    changeMenuPosition(0);
  }
}

abstract class MainState {}

class LogOutState extends MainState {}

class MenuPositionState extends MainState {
  final int menuPosition;

  MenuPositionState(this.menuPosition);
}

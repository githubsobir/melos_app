import 'package:domain/usecase/auth_usecase.dart';
import 'package:domain/usecase/profile_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  final AuthUseCase _authUseCase;
  final ProfileUseCase _profileUseCase;

  MainCubit(this._authUseCase, this._profileUseCase)
      : super(MenuPositionState(0));

  bool hasUser = false;

  changeMenuPosition(int index) {
    emit(MenuPositionState(index));
  }

  logOut() async {
    if (!hasUser) return;
    var logOut = await _authUseCase.logOut();
    if (logOut) {
      emit(LogOutState());
    }
  }

  sendFirebaseToken() async {
    try {
      bool isFirstTime = await _authUseCase.isFirsTime();
      if (isFirstTime) {
        _authUseCase.sendFirebaseToken();
        _authUseCase.setFirstTime(false);
      }
    } catch (e) {
      print(e);
    }
  }

  unreadNotification() async {
    if (await _authUseCase.hasUser()) {
      var response = await _profileUseCase.unreadNotification();
      if (response.success) {
        emit(NotificationState(response.body != 0));
      }
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
  final int pageIndex;

  MenuPositionState(this.pageIndex);
}

class NotificationState extends MainState {
  final bool hasNotification;

  NotificationState(this.hasNotification);
}

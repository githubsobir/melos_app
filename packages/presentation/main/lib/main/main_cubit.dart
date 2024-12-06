import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  // final MainUseCase _mainUseCase;

  // MainCubit(this._mainUseCase) : super(MainInitial());
  MainCubit() : super(MainInitial());

  var pageIndex = 0;

  changeMenuPosition(int index) {
    pageIndex = index;
    emit(MenuPositionState(index));
  }
}

abstract class MainState {}

class MainInitial extends MainState {}

class MenuPositionState extends MainState {
  final int menuPosition;

  MenuPositionState(this.menuPosition);
}

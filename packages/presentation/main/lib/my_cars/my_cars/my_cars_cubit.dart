import 'package:domain/model/cars/my_car_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCarsCubit extends Cubit<MyCarsState> {
  final CarsUseCase _carsUseCase;

  MyCarsCubit(this._carsUseCase) : super(MyCarsInitial());

  getMyCars() async {
    if (!await _carsUseCase.hasUser()) return;
    emit(LoadingState());
    var response = await _carsUseCase.getMyCars();
    if (response.success) {
      var cars = response.body;
      if (cars != null) {
        emit(CarsState(cars));
      }
    } else {
      emit(const CarsState([]));
    }
  }
}

sealed class MyCarsState extends Equatable {
  const MyCarsState();
}

final class MyCarsInitial extends MyCarsState {
  @override
  List<Object> get props => [];
}

final class LoadingState extends MyCarsState {
  @override
  List<Object> get props => [];
}

final class CarsState extends MyCarsState {
  final List<MyCarModel> cars;

  const CarsState(this.cars);

  @override
  List<Object> get props => [cars];
}

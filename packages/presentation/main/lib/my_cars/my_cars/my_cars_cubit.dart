import 'package:domain/model/cars/current_car_model.dart';
import 'package:domain/model/cars/my_car_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCarsCubit extends Cubit<MyCarsState> {
  final CarsUseCase _carsUseCase;

  MyCarsCubit(this._carsUseCase)
      : super(const MyCarsState(myCars: [], currentCars: []));

  getMyCars() async {
    var response = await _carsUseCase.getMyCars();
    if (response.success) {
      var cars = response.body;
      if (cars != null) {
        emit(state.copyWith(myCars: cars));
      }
    } else {
      emit(state.copyWith(myCars: []));
    }
  }

  currentCarsOwners() async {
    var response = await _carsUseCase.currentCarsOwners();
    if (response.success) {
      var cars = response.body;
      if (cars != null) {
        emit(state.copyWith(currentCars: cars));
      }
    } else {
      emit(state.copyWith(currentCars: []));
    }
  }

  changeCarStatus(num carId) async {
    var response = await _carsUseCase.changeCarStatus(carId: carId);
    if (response.success) {
      getMyCars();
    }
  }

  Future<void> onCompleteCar(num id) async {
    var response = await _carsUseCase.onCompleteCar(
      id:id
    );
    if (response.success) {
      currentCarsOwners();
      getMyCars();
    }
  }
}

final class MyCarsState extends Equatable {
  final List<MyCarModel> myCars;
  final List<CurrentCarModel> currentCars;

  const MyCarsState({
    required this.myCars,
    required this.currentCars,
  });

  MyCarsState copyWith({
    List<MyCarModel>? myCars,
    List<CurrentCarModel>? currentCars,
  }) {
    return MyCarsState(
      myCars: myCars ?? this.myCars,
      currentCars: currentCars ?? this.currentCars,
    );
  }

  @override
  List<Object?> get props => [currentCars, myCars];
}

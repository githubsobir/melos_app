import 'package:domain/model/car_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarsCubit extends Cubit<CarsState> {
  final CarsUseCase _carsUseCase;

  CarsCubit(this._carsUseCase) : super(CarsInitial());

  Future<void> carsList() async {
    emit(CarsLoaderState());
    var response = await _carsUseCase.carsList();
    if (response.success) {
      var cars = response.body;
      if (cars != null) {
        emit(CarListState(cars));
      }
    }
  }

  Future<void> likeCar(int id) async {
    var response = await _carsUseCase.likeCar(id);
    // if (response.success) {
    //   var cars = response.body;
    //   if (cars != null) {
    //     emit(CarListState(cars));
    //   }
    // }
  }

  Future<void> likedCar(int carId) async {
    var response = await _carsUseCase.likedCar(
        carId: carId
    );
    if (response.success) {
      var cars = response.body;
      if (cars != null) {
        emit(CarListState(cars));
      }
    }
  }
}

abstract class CarsState extends Equatable {
  const CarsState();
}

class CarsInitial extends CarsState {
  @override
  List<Object> get props => [];
}

class CarsLoaderState extends CarsState {
  @override
  List<Object> get props => [];
}

class CarListState extends CarsState {
  final CarsModel carsModel;

  const CarListState(this.carsModel);

  @override
  List<Object> get props => [carsModel];
}

class LikedCarListState extends CarsState {
  final CarsModel carsModel;

  const LikedCarListState(this.carsModel);

  @override
  List<Object> get props => [carsModel];
}

import 'package:domain/model/cars/car_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit(this._carsUseCase) : super(LocationsInitial());
  final CarsUseCase _carsUseCase;

  Future<void> likedCars({bool isRefreshed = false}) async {
    if (!await _carsUseCase.hasUser()) return;
    emit(LoadingState());
    var response = await _carsUseCase.likedCars();
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

sealed class LocationsState extends Equatable {
  const LocationsState();
}

final class LocationsInitial extends LocationsState {
  @override
  List<Object> get props => [];
}

final class LoadingState extends LocationsState {
  @override
  List<Object> get props => [];
}

final class CarsState extends LocationsState {
  final List<CarModel> liked;

  const CarsState(this.liked);

  @override
  List<Object> get props => [liked];
}

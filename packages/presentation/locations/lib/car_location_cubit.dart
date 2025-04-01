import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarLocationCubit extends Cubit<CarLocationState> {
  final CarsUseCase _carsUseCase;

  CarLocationCubit(this._carsUseCase) : super(CarLocationInitial());

  Future<void> geocoder({
    required double latitude,
    required double longitude,
  }) async {
    var response = await _carsUseCase.geocoder(
      latitude: latitude,
      longitude: longitude,
    );
    if (response.success) {
      var place = response.body;
      if (place != null) {
        emit(CarLocationName(locationName: place));
      }
    }
  }
}

sealed class CarLocationState extends Equatable {
  const CarLocationState();
}

final class CarLocationInitial extends CarLocationState {
  @override
  List<Object> get props => [];
}

final class CarLocationName extends CarLocationState {
  final String locationName;

  const CarLocationName({required this.locationName});

  @override
  List<Object> get props => [locationName];
}

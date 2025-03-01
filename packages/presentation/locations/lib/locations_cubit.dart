import 'package:domain/model/location/gps_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit(this._carsUseCase) : super(LocationsInitial());
  final CarsUseCase _carsUseCase;

  Future<void> gpsList() async {
    emit(LoadingState());
    Position? position = await Geolocator.getLastKnownPosition();
    var response = await _carsUseCase.gpsList(
      latitude: position?.latitude,
      longitude: position?.longitude,
    );
    if (response.success) {
      var cars = response.body;
      if (cars != null) {
        emit(GpsState(cars));
      }
    } else {
      emit(const GpsState([]));
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

final class GpsState extends LocationsState {
  final List<GpsModel> gps;

  const GpsState(this.gps);

  @override
  List<Object> get props => [gps];
}

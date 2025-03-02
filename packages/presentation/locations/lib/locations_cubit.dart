import 'package:domain/model/location/gps_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit(this._carsUseCase)
      : super(const LocationsState(isLoading: false, gps: []));
  final CarsUseCase _carsUseCase;

  Future<void> gpsList() async {
    emit(state.copyWith(isLoading: true));
    Position? position = await Geolocator.getLastKnownPosition();
    var response = await _carsUseCase.gpsList(
      latitude: position?.latitude,
      longitude: position?.longitude,
    );
    if (response.success) {
      var gps = response.body;
      if (gps != null) {
        emit(state.copyWith(
          isLoading: false,
          gps: gps,
        ));
      }
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }
}

class LocationsState extends Equatable {
  final bool isLoading;
  final List<GpsModel> gps;

  const LocationsState({
    required this.isLoading,
    required this.gps,
  });

  LocationsState copyWith({bool? isLoading, List<GpsModel>? gps}) {
    return LocationsState(
      isLoading: isLoading ?? this.isLoading,
      gps: gps ?? this.gps,
    );
  }

  @override
  List<Object> get props => [gps, isLoading];
}

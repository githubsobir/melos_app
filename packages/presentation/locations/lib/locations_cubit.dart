import 'package:domain/model/location/gps_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_maps_mapkit_lite/init.dart' as init;

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit(this._carsUseCase)
      : super(const LocationsState(isLoading: false, gps: []));
  final CarsUseCase _carsUseCase;

  initMap() async {
    await init.initMapkit(apiKey: '973005bb-3cfc-4e46-81d2-26939d2b8c3c');
  }

  Future<void> gpsList() async {
    emit(state.copyWith(isLoading: true));
    Position? position;

    try {
      position = await Geolocator.getLastKnownPosition();
    } catch (e) {
      print(e);
    }

    var response = await _carsUseCase.gpsList(
      latitude: position?.latitude??0.0,
      longitude: position?.longitude??0.0,
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

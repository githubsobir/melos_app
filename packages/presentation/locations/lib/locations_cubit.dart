import 'package:domain/model/location/gps_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_maps_mapkit_lite/init.dart' as init;
import 'package:yandex_maps_mapkit_lite/mapkit.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit(this._carsUseCase)
      : super(
          const LocationsState(
            isLoading: false,
            gps: [],
            point: Point(
              latitude: 41.313755,
              longitude: 69.248912,
            ),
          ),
        );
  final CarsUseCase _carsUseCase;

  Future<void> gpsList() async {
    emit(state.copyWith(isLoading: true));
    try {
      var position = await Geolocator.getLastKnownPosition();
      emit(state.copyWith(
          point: Point(
        latitude: position?.latitude ?? 0,
        longitude: position?.longitude ?? 0,
      )));
    } catch (e) {
      print(e);
    }

    var response = await _carsUseCase.gpsList(
      latitude: state.point.latitude,
      longitude: state.point.longitude,
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

  Future<void> mapInitial() async {
    var response = await _carsUseCase.mapApiKey();
    if (response.success) {
      var gps = response.body;
      if (gps != null) {
        // await init.initMapkit(apiKey: gps);
        await init.initMapkit(apiKey: "973005bb-3cfc-4e46-81d2-26939d2b8c3c");
      }
    }
  }
}

class LocationsState extends Equatable {
  final bool isLoading;
  final List<GpsModel> gps;
  final Point point;

  const LocationsState({
    required this.isLoading,
    required this.gps,
    required this.point,
  });

  LocationsState copyWith({
    bool? isLoading,
    List<GpsModel>? gps,
    Point? point,
  }) {
    return LocationsState(
      isLoading: isLoading ?? this.isLoading,
      gps: gps ?? this.gps,
      point: point ?? this.point,
    );
  }

  @override
  List<Object> get props => [gps, isLoading, point];
}

import 'package:domain/model/location/gps_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

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
            locationName: '',
          ),
        );
  final CarsUseCase _carsUseCase;

  Future<void> gpsList() async {
    emit(state.copyWith(isLoading: true));
    try {
      var position = await Geolocator.getLastKnownPosition();
      if (position != null) {
        emit(
          state.copyWith(
            point: Point(
              latitude: position.latitude,
              longitude: position.longitude,
            ),
          ),
        );
      }
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

  // Future<void> mapInitial() async {
  //   var response = await _carsUseCase.mapApiKey();
  //   if (response.success) {
  //     var gps = response.body;
  //     if (gps != null) {
  //       // await init.initMapkit(apiKey: gps);
  //       // await init.initMapkit(apiKey: "973005bb-3cfc-4e46-81d2-26939d2b8c3c");
  //     }
  //   }
  // }

  Future<void> geocoder() async {
    var response = await _carsUseCase.geocoder(
      latitude: state.point.latitude,
      longitude: state.point.longitude,
    );
    if (response.success) {
      var place = response.body;
      if (place != null) {
        emit(state.copyWith(locationName: place));
      }
    }
  }
}

class LocationsState extends Equatable {
  final bool isLoading;
  final List<GpsModel> gps;
  final Point point;
  final String locationName;

  const LocationsState({
    required this.isLoading,
    required this.gps,
    required this.point,
    required this.locationName,
  });

  LocationsState copyWith({
    bool? isLoading,
    List<GpsModel>? gps,
    Point? point,
    String? locationName,
  }) {
    return LocationsState(
      isLoading: isLoading ?? this.isLoading,
      gps: gps ?? this.gps,
      point: point ?? this.point,
      locationName: locationName ?? this.locationName,
    );
  }

  @override
  List<Object> get props => [gps, isLoading, point, locationName];
}

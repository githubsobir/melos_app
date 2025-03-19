import 'package:domain/model/cars/car_create_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCarCubit extends Cubit<CreateCarState> {
  final CarsUseCase _carsUseCase;

  CreateCarCubit(this._carsUseCase)
      : super(
          CreateCarState(
            position: 0,
            carModel: CarCreateModel(),
            isLoading: false,
          ),
        );

  changePositionToLeft() {
    var position = state.position;
    emit(state.copyWith(position: --position));
  }

  // Future<void> mapInitial() async {
  //   var response = await _carsUseCase.mapApiKey();
  //   if (response.success) {
  //     var gps = response.body;
  //     if (gps != null) {
  //       // await init.initMapkit(apiKey: gps);
  //       await init.initMapkit(apiKey: "973005bb-3cfc-4e46-81d2-26939d2b8c3c");
  //     }
  //   }
  // }

  changePositionToRight() async {
    print(state.position);
    if (state.position == 0) {
      emit(state.copyWith(position: 1));
    } else if (state.position == 1) {
      if ((state.carModel.make ?? "").isNotEmpty &&
          (state.carModel.model ?? "").isNotEmpty &&
          (state.carModel.registrationNumber ?? "").isNotEmpty &&
          (state.carModel.city ?? "").isNotEmpty &&
          (state.carModel.transmission ?? "").isNotEmpty &&
          (state.carModel.passengerCapacity ?? 0) > 0 &&
          (state.carModel.latitude != null) &&
          (state.carModel.longitude != null)) {
        if (await carCreateProcess(1)) {
          emit(state.copyWith(position: 2));
        } else {}
      }
    } else if (state.position == 2) {
      if ((state.carModel.year ?? 0) > 0 &&
          (state.carModel.mileage ?? 0) > 0 &&
          (state.carModel.fuelCapacity ?? 0) > 0 &&
          (state.carModel.photos ?? []).isNotEmpty) {
        if (await carCreateProcess(2)) {
          emit(state.copyWith(position: 3));
        } else {}
      }
    } else if (state.position == 3) {
      emit(state.copyWith(position: 4));
    } else {
      emit(state.copyWith(position: 5));
    }
  }

  Future<bool> carCreateProcess(int processNumber) async {
    emit(state.copyWith(isLoading: true));
    var response = await _carsUseCase.carCreate(
      processNumber: processNumber,
      carModel: state.carModel,
    );
    return response.success;
  }

  onChangeModel(String value) {
    emit(state.copyWith(carModel: state.carModel.copyWith(model: value)));
  }

  onChangedMake(String value) {
    emit(state.copyWith(carModel: state.carModel.copyWith(make: value)));
  }

  onChangedRegNumber(String value) {
    emit(state.copyWith(
        carModel: state.carModel.copyWith(registrationNumber: value)));
  }

  onChangedCity(String value) {
    emit(state.copyWith(carModel: state.carModel.copyWith(city: value)));
  }

  onChangedTransmission(String value) {
    emit(
        state.copyWith(carModel: state.carModel.copyWith(transmission: value)));
  }

  onChangedPassengerCapacity(String value) {
    emit(state.copyWith(
        carModel:
            state.carModel.copyWith(passengerCapacity: num.parse(value))));
  }

  onChangedLocations(double latitude, double longitude) {
    emit(state.copyWith(
      carModel: state.carModel.copyWith(
        latitude: latitude,
        longitude: longitude,
      ),
    ));
  }

  void onChangedYear(String value) {
    emit(state.copyWith(
        carModel: state.carModel.copyWith(year: num.parse(value))));
  }

  void onChangedMileage(String value) {
    emit(state.copyWith(
        carModel: state.carModel.copyWith(mileage: num.parse(value))));
  }

  void onChangedFuelCapacity(String value) {
    emit(state.copyWith(
        carModel: state.carModel.copyWith(fuelCapacity: num.parse(value))));
  }

  onChangedPhotos(List<String> photos) {
    emit(state.copyWith(carModel: state.carModel.copyWith(photos: photos)));
  }
}

@immutable
class CreateCarState extends Equatable {
  final int position;
  final bool isLoading;
  final CarCreateModel carModel;

  const CreateCarState({
    required this.position,
    required this.carModel,
    required this.isLoading,
  });

  CreateCarState copyWith({
    int? position,
    bool? isLoading,
    CarCreateModel? carModel,
  }) {
    return CreateCarState(
      position: position ?? this.position,
      carModel: carModel ?? this.carModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        position,
        carModel,
      ];
}

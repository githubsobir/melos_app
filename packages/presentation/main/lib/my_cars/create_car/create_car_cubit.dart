import 'package:domain/model/cars/car_create_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCarCubit extends Cubit<CreateCarState> {
  CreateCarCubit()
      : super(
          CreateCarState(
            position: 0,
            carModel: CarCreateModel(),
          ),
        );

  changePosition(int position) {
    if (position == 2 &&
        (state.carModel.make ?? "").isNotEmpty &&
        (state.carModel.model ?? "").isNotEmpty &&
        (state.carModel.registrationNumber ?? "").isNotEmpty &&
        (state.carModel.city ?? "").isNotEmpty &&
        (state.carModel.transmission ?? "").isNotEmpty &&
        (state.carModel.passengerCapacity ?? 0) > 0) {
      emit(state.copyWith(position: position));
    } else if (position == 3) {
      emit(state.copyWith(position: position));
    } else {
      emit(state.copyWith(position: position));
    }


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
}

@immutable
class CreateCarState extends Equatable {
  final int position;
  final CarCreateModel carModel;

  const CreateCarState({
    required this.position,
    required this.carModel,
  });

  CreateCarState copyWith({
    int? position,
    CarCreateModel? carModel,
  }) {
    return CreateCarState(
      position: position ?? this.position,
      carModel: carModel ?? this.carModel,
    );
  }

  @override
  List<Object> get props => [
        position,
        carModel,
      ];
}

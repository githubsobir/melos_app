import 'package:common/widgets/custom_functions.dart';
import 'package:domain/model/cars/car_step.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarPage1Cubit extends Cubit<CarPage1State> {
  final CarsUseCase _carsUseCase;

  CarPage1Cubit(this._carsUseCase)
      : super(
          CarPage1State(
              position: 0,
              carModel: CarStep1Entities(
                  cities: [], makes: [], models: [], transmission: []),
              isLoading: false,
              error: '',
              isEmpty: false),
        );

  Future<bool> getCarStep1() async {
    emit(state.copyWith(isLoading: true));
    var response = await _carsUseCase.carStep1();
    emit(state.copyWith(isLoading: false));
    if (response.success == false) {
      showToastSms(response.exceptionBody.toString());
      return false;
    } else {
      emit(state.copyWith(
        carModel: CarStep1Entities(
          cities: response.body!.cities,
          makes: response.body!.makes,
          models: response.body!.models,
          transmission: response.body!.transmission,
        ),
      ));
      return true;
    }
  }
}

@immutable
class CarPage1State extends Equatable {
  final int position;
  final bool isLoading;
  final CarStep1Entities carModel;
  final String error;
  final bool isEmpty;

  const CarPage1State({
    required this.position,
    required this.carModel,
    required this.isLoading,
    required this.error,
    required this.isEmpty,
  });

  CarPage1State copyWith({
    int? position,
    bool? isLoading,
    bool? isEmpty,
    CarStep1Entities? carModel,
    String? error,
  }) {
    return CarPage1State(
      position: position ?? this.position,
      carModel: carModel ?? this.carModel,
      isLoading: isLoading ?? this.isLoading,
      isEmpty: isEmpty ?? this.isEmpty,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        position,
        carModel,
        isLoading,
        error,
        isEmpty,
      ];
}

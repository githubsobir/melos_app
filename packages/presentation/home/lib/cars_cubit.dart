import 'dart:async';

import 'package:domain/model/car_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarsCubit extends Cubit<CarsState> {
  CarsCubit(this._carsUseCase)
      : super(const CarsState(
          recommended: [],
          liked: [],
          isLoading: false,
        ));
  final CarsUseCase _carsUseCase;
  int page = 1;

  Future<void> recommendedCars() async {
    emit(state.copyWith(isLoading: true));
    var response = await _carsUseCase.recommendedCars(page: page);
    if (response.success) {
      var cars = response.body;
      if (cars != null) {
        emit(state.copyWith(isLoading: false, recommended: cars));
      }
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> likeCar(int id) async {
    var response = await _carsUseCase.likeCar(id);
    // if (response.success) {
    //   var cars = response.body;
    //   if (cars != null) {
    //     emit(CarListState(cars));
    //   }
    // }
  }

  Future<void> likedCars() async {
    var response = await _carsUseCase.likedCars();
    if (response.success) {
      var cars = response.body;
      if (cars != null) {
        emit(state.copyWith(isLoading: false, liked: cars));
      }
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }
}

class CarsState extends Equatable {
  final bool isLoading;
  final List<CarModel> recommended;
  final List<CarModel> liked;

  const CarsState({
    required this.recommended,
    required this.liked,
    required this.isLoading,
  });

  CarsState copyWith({
    bool? isLoading,
    List<CarModel>? recommended,
    List<CarModel>? liked,
  }) {
    return CarsState(
      isLoading: isLoading ?? this.isLoading,
      recommended: recommended ?? this.recommended,
      liked: liked ?? this.liked,
    );
  }

  @override
  List<Object> get props => [recommended, liked];
}

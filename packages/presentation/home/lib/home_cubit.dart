import 'dart:async';

import 'package:domain/model/cars/car_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<CarsState> {
  HomeCubit(this._carsUseCase)
      : super(const CarsState(
          recommended: [],
          popular: [],
          isLoading: false,
        ));
  final CarsUseCase _carsUseCase;
  int recommendedCarsPage = 1;
  int popularCarsPage = 1;
  bool recommendedCarsHasNext = true;
  bool popularCarsHasNext = true;
  String _startDataTime = DateTime.now().toIso8601String();
  String _endDataTime = DateTime.now().toIso8601String();

  setDateTime({
    required String startDataTime,
    required String endDataTime,
  }) {
    _startDataTime = startDataTime;
    _endDataTime = endDataTime;
    popularCars(isRefreshed: true);
    recommendedCars(isRefreshed: true);
  }

  Future<void> recommendedCars({
    bool isRefreshed = false,
  }) async {
    if (isRefreshed) {
      recommendedCarsPage = 1;
      recommendedCarsHasNext = true;
    }
    if (recommendedCarsHasNext) {
      emit(state.copyWith(isLoading: true));
      var response = await _carsUseCase.recommendedCars(
        page: recommendedCarsPage,
        startDataTime: _startDataTime,
        endDataTime: _endDataTime,
        latitude: "latitude",
        longitude: "longitude",
      );
      if (response.success) {
        var cars = response.body;
        if (cars != null) {
          emit(state.copyWith(
            isLoading: false,
            recommended: isRefreshed ? cars : (state.recommended + cars),
          ));
          recommendedCarsPage++;
        }
      } else {
        recommendedCarsHasNext = false;
        emit(state.copyWith(isLoading: false));
      }
    }
  }

  Future<void> popularCars({bool isRefreshed = false}) async {
    if (!await hasUser()) return;
    if (isRefreshed) {
      popularCarsPage = 1;
      popularCarsHasNext = true;
    }
    if (popularCarsHasNext) {
      emit(state.copyWith(isLoading: true));
      var response = await _carsUseCase.popularCars(
        page: popularCarsPage,
        startDataTime: _startDataTime,
        endDataTime: _endDataTime,
        latitude: "latitude",
        longitude: "longitude",
      );
      if (response.success) {
        var cars = response.body;
        if (cars != null) {
          emit(state.copyWith(
            isLoading: false,
            popular: isRefreshed ? cars : (state.popular + cars),
          ));
          popularCarsPage++;
        }
      } else {
        popularCarsHasNext = false;
        emit(state.copyWith(isLoading: false));
      }
    }
  }

  Future<bool> hasUser() async {
    return await _carsUseCase.hasUser();
  }

  Future<void> likeCar(CarModel model, bool isLiked) async {
    await _carsUseCase.likeCar(model.id ?? 0, isLiked);
    // await popularCars(isRefreshed: true);
    // var recommendedCars = state.recommended;
    // var selectedCar =
    //     recommendedCars.firstWhere((element) => element.id == (model.id ?? 0));
    // selectedCar.liked = isLiked;
    // emit(state.copyWith(recommended: recommendedCars));
  }
}

class CarsState extends Equatable {
  final bool isLoading;
  final List<CarModel> recommended;
  final List<CarModel> popular;

  const CarsState({
    required this.recommended,
    required this.popular,
    required this.isLoading,
  });

  CarsState copyWith({
    bool? isLoading,
    List<CarModel>? recommended,
    List<CarModel>? popular,
  }) {
    return CarsState(
      isLoading: isLoading ?? this.isLoading,
      recommended: recommended ?? this.recommended,
      popular: popular ?? this.popular,
    );
  }

  @override
  List<Object> get props => [recommended, popular];
}

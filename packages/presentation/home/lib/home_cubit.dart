import 'dart:async';

import 'package:domain/model/cars/car_model.dart';
import 'package:domain/model/cars/filter_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._carsUseCase)
      : super(HomeState(
            recommended: [],
            popular: [],
            isLoading: false,
            search: "",
            filter: FilterModel(
                cityCounts: [],
                passengerCapacityCounts: [],
                categoryCounts: [],
                makeCounts: [],
                modelCounts: [],
                transmissionCounts: [])));
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

  Future<void> filter() async {
    var response = await _carsUseCase.filter();
    if (response.success) {
      var filter = response.body;
      if (filter != null) {
        emit(state.copyWith(filter: filter));
      }
    }
  }

  void clearFilters() {
    final clearedFilter = state.filter.copyWith(
      categoryCounts: state.filter.categoryCounts
          .map((e) => e.copyWith(isSelected: false))
          .toList(),
      cityCounts: state.filter.cityCounts
          .map((e) => e.copyWith(isSelected: false))
          .toList(),
      passengerCapacityCounts: state.filter.passengerCapacityCounts
          .map((e) => e.copyWith(isSelected: false))
          .toList(),
      makeCounts: state.filter.makeCounts, // yoki istalgan default qiymat
    );

    emit(state.copyWith(filter: clearedFilter));
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
      Position? position;

      try {
        position = await Geolocator.getLastKnownPosition();
      } catch (e) {
        print(e);
      }
      var response = await _carsUseCase.recommendedCars(
        page: recommendedCarsPage,
        startDataTime: _startDataTime,
        endDataTime: _endDataTime,
        latitude: position?.latitude != null ? "${position?.latitude}" : null,
        longitude: position?.longitude != null ? "${position?.latitude}" : null,
        search: state.search,
        maxPrice: state.filter.maxPrice,
        category: state.filter.categoryCounts
            .where((element) => element.isSelected)
            .toList()
            .map((e) => e.key)
            .toList(),
        passengers: state.filter.passengerCapacityCounts
            .where((element) => element.isSelected)
            .toList()
            .map((e) => e.key)
            .toList(),
        cities: state.filter.cityCounts
            .where((element) => element.isSelected)
            .toList()
            .map((e) => e.key)
            .toList(),
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

  Future<void> search(String text) async {
    emit(state.copyWith(searchedText: text));
    recommendedCars(isRefreshed: true);
  }

  Future<void> popularCars({bool isRefreshed = false}) async {
    if (isRefreshed) {
      popularCarsPage = 1;
      popularCarsHasNext = true;
    }
    if (popularCarsHasNext) {
      emit(state.copyWith(isLoading: true));
      Position? position;
      try {
        position = await Geolocator.getLastKnownPosition();
      } catch (e) {
        print(e);
      }
      var response = await _carsUseCase.popularCars(
        page: popularCarsPage,
        startDataTime: _startDataTime,
        endDataTime: _endDataTime,
        latitude: position?.latitude != null ? "${position?.latitude}" : null,
        longitude: position?.longitude != null ? "${position?.latitude}" : null,
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
  }
}

class HomeState extends Equatable {
  final bool isLoading;
  final List<CarModel> recommended;
  final List<CarModel> popular;
  final String search;
  final FilterModel filter;

  const HomeState({
    required this.recommended,
    required this.popular,
    required this.isLoading,
    required this.search,
    required this.filter,
  });

  HomeState copyWith({
    bool? isLoading,
    List<CarModel>? recommended,
    List<CarModel>? popular,
    String? searchedText,
    FilterModel? filter,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      recommended: recommended ?? this.recommended,
      popular: popular ?? this.popular,
      search: searchedText ?? this.search,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [
        recommended,
        popular,
        isLoading,
        search,
        filter,
      ];
}

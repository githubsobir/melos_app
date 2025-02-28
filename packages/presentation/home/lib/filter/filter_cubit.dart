import 'dart:async';

import 'package:domain/model/cars/filter_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(this._carsUseCase)
      : super(
          FilterState(
            isLoading: false,
            filter: FilterModel(
              passengerCapacityCounts: [],
              cityCounts: [],
              categoryCounts: [],
            ),
          ),
        );
  final CarsUseCase _carsUseCase;

  Future<void> filter() async {
    emit(state.copyWith(isLoading: true));
    var response = await _carsUseCase.filter();
    if (response.success) {
      var cars = response.body;
      if (cars != null) {
        emit(state.copyWith(isLoading: false, filter: cars));
      }
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }
}

class FilterState extends Equatable {
  final bool isLoading;
  final FilterModel filter;

  const FilterState({
    required this.filter,
    required this.isLoading,
  });

  FilterState copyWith({
    bool? isLoading,
    FilterModel? filter,
  }) {
    return FilterState(
      isLoading: isLoading ?? this.isLoading,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [filter, isLoading];
}

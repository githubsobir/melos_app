import 'package:domain/model/location/current_gps_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCarLocationCubit extends Cubit<CarLocationState> {
  final CarsUseCase _carsUseCase;

  MyCarLocationCubit(this._carsUseCase) : super(CarLocationInitial());

  Future<void> gpsLocation({
    required num id,
  }) async {
    emit(CarLocationLoadingState());
    var response = await _carsUseCase.gpsLocation(
      id: id,
    );
    if (response.success) {
      var point = response.body;
      if (point != null) {
        emit(CarLocationGPSState(point: point));
      }
    }
  }
}

sealed class CarLocationState extends Equatable {
  const CarLocationState();
}

final class CarLocationInitial extends CarLocationState {
  @override
  List<Object> get props => [];
}

final class CarLocationLoadingState extends CarLocationState {
  @override
  List<Object> get props => [];
}

final class CarLocationGPSState extends CarLocationState {
  final CurrentGpsModel point;

  const CarLocationGPSState({required this.point});

  @override
  List<Object> get props => [point];
}

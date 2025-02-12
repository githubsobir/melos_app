import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/model/cars/car_detail_info_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';

class CarInfoDetailCubit extends Cubit<CarInfoDetailState> {
  CarInfoDetailCubit(this._carsUseCase) : super(CarInfoDetailInitial());
  final CarsUseCase _carsUseCase;

  Future<void> getCarDetail(num carId) async {
    emit(LoadingState());
    var response = await _carsUseCase.getCarDetail(
      carId: carId,
    );
    if (response.success) {
      var info = response.body;
      if (info != null) {
        emit(CarDetailState(info));
      }
    } else {
      // emit(state.copyWith(isLoading: false));
    }
  }
  Future<void> likeCar(int id, bool isLiked) async {
    var response = await _carsUseCase.likeCar(id, isLiked);
  }
}

sealed class CarInfoDetailState extends Equatable {
  const CarInfoDetailState();
}

final class CarInfoDetailInitial extends CarInfoDetailState {
  @override
  List<Object> get props => [];
}

final class LoadingState extends CarInfoDetailState {
  @override
  List<Object> get props => [];
}

final class CarDetailState extends CarInfoDetailState {
  final CarDetailInfoModel carDetail;

  const CarDetailState(this.carDetail);

  @override
  List<Object> get props => [];
}

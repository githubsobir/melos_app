import 'package:domain/model/cars/car_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this._carsUseCase) : super(FavouriteInitial());
  final CarsUseCase _carsUseCase;

  Future<void> likedCars({bool isRefreshed = false}) async {
    emit(LoadingState());
    var response = await _carsUseCase.likedCars();
    if (response.success) {
      var cars = response.body;
      if (cars != null) {
        emit(CarsState(cars));
      }
    } else {
      emit(const CarsState([]));
    }
  }

  Future<void> likeCar(int id, bool isLiked) async {
    var response = await _carsUseCase.likeCar(id, isLiked);
  }
}

sealed class FavouriteState extends Equatable {
  const FavouriteState();
}

final class FavouriteInitial extends FavouriteState {
  @override
  List<Object> get props => [];
}

final class LoadingState extends FavouriteState {
  @override
  List<Object> get props => [];
}

final class CarsState extends FavouriteState {
  final List<CarModel> liked;

  const CarsState(this.liked);

  @override
  List<Object> get props => [liked];
}

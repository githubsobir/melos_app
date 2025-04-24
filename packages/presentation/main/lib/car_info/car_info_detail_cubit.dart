import 'package:domain/model/cars/car_detail_info_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarInfoDetailCubit extends Cubit<CarDetailState> {
  CarInfoDetailCubit(this._carsUseCase)
      : super(
          CarDetailState(
            carDetail: CarDetailInfoModel(),
            errorMessage: "",
            hasError: false,
            goNextPage: false,
          ),
        );
  final CarsUseCase _carsUseCase;
  var hasUser = false;

  Future<void> getCarDetail(num carId) async {
    var response = await _carsUseCase.getCarDetail(
      carId: carId,
    );
    if (response.success) {
      var info = response.body;
      if (info != null) {
        emit(state.copyWith(carDetail: info));
      }
    }
  }

  Future<void> checkDate({
    required num carId,
    required String startDate,
    required String endDate,
  }) async {
    emit(state.copyWith(
      hasError: false,
      errorMessage: "",
      goNextPage: false,
    ));
    var response = await _carsUseCase.checkDate(
      carId: carId,
      startDate: startDate,
      endDate: endDate,
    );
    if (response.success) {
      var info = response.body;
      if (info != null) {
        if (info.isAvailable == true) {
          //
          emit(state.copyWith(
            hasError: false,
            errorMessage: "",
            goNextPage: true,
          ));
        } else {
          emit(state.copyWith(
            hasError: true,
            errorMessage: info.message,
            goNextPage: false,
          ));
        }
      }
    }
  }

  Future<void> likeCar(int id, bool isLiked) async {
    await _carsUseCase.likeCar(id, isLiked);
  }

  Future<void> hasUserProfile() async {
    hasUser = await _carsUseCase.hasUser();
  }
}

final class CarDetailState extends Equatable {
  final CarDetailInfoModel carDetail;
  final String errorMessage;
  final bool hasError;
  final bool goNextPage;

  const CarDetailState({
    required this.carDetail,
    required this.errorMessage,
    required this.hasError,
    required this.goNextPage,
  });

  CarDetailState copyWith({
    CarDetailInfoModel? carDetail,
    String? errorMessage,
    bool? hasError,
    bool? goNextPage,
  }) {
    return CarDetailState(
      carDetail: carDetail ?? this.carDetail,
      errorMessage: errorMessage ?? this.errorMessage,
      hasError: hasError ?? this.hasError,
      goNextPage: goNextPage ?? this.goNextPage,
    );
  }

  @override
  List<Object> get props => [
        carDetail,
        errorMessage,
        hasError,
        goNextPage,
      ];
}

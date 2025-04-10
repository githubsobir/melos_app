import 'package:bloc/bloc.dart';
import 'package:domain/model/location/point_model.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:equatable/equatable.dart';

class SelectLocationCubit extends Cubit<SelectLocationState> {
  final CarsUseCase _carsUseCase;

  SelectLocationCubit(this._carsUseCase)
      : super(const SelectLocationState(point: null));

  Future<void> geocoder({
    required double latitude,
    required double longitude,
  }) async {
    var response = await _carsUseCase.geocoder(
      latitude: latitude,
      longitude: longitude,
    );
    if (response.success) {
      var place = response.body;
      if (place != null) {
        emit(
          state.copyWith(
            point: PointModel(
              latitude: latitude,
              longitude: longitude,
              address: place,
            ),
          ),
        );
      }
    }
  }
}

class SelectLocationState extends Equatable {
  final PointModel? point;

  const SelectLocationState({required this.point});

  SelectLocationState copyWith({
    PointModel? point,
  }) {
    return SelectLocationState(
      point: point ?? this.point,
    );
  }

  @override
  List<Object?> get props => [point];
}

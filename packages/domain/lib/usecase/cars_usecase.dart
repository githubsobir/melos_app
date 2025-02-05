import 'package:domain/model/car_model.dart';
import 'package:domain/repository/cars_repository.dart';
import 'package:domain/utils/base_result.dart';

class CarsUseCase {
  final CarsRepository _authRepository;

  CarsUseCase(this._authRepository);

  Future<BaseResult<CarsModel>> carsList() {
    return _authRepository.carsList();
  }

  Future<BaseResult<bool>> likeCar(int id) {
    return _authRepository.likeCar(id);
  }

  likedCar({required int carId}) {}
}

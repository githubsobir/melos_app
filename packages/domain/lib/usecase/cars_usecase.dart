import 'package:domain/model/car_model.dart';
import 'package:domain/repository/cars_repository.dart';
import 'package:domain/utils/base_result.dart';

class CarsUseCase {
  final CarsRepository _authRepository;

  CarsUseCase(this._authRepository);

  Future<BaseResult<List<CarModel>>> recommendedCars({required int page}) {
    return _authRepository.recommendedCars(page: page);
  }

  Future<BaseResult<bool>> likeCar(int id,bool isLiked) {
    return _authRepository.likeCar(id,isLiked);
  }

  Future<BaseResult<List<CarModel>>> likedCars() {
    return _authRepository.likedCars();
  }
}

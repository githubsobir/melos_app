import 'package:domain/model/cars/car_detail_info_model.dart';
import 'package:domain/model/cars/car_model.dart';
import 'package:domain/model/cars/filter_model.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/cars_repository.dart';
import 'package:domain/utils/base_result.dart';

class CarsUseCase {
  final CarsRepository _carsDetail;
  final AuthRepository _authRepository;

  CarsUseCase(this._carsDetail, this._authRepository);

  Future<BaseResult<List<CarModel>>> recommendedCars({required int page}) {
    return _carsDetail.recommendedCars(page: page);
  }

  Future<BaseResult<bool>> likeCar(num id, bool isLiked) {
    return _carsDetail.likeCar(id, isLiked);
  }

  Future<BaseResult<List<CarModel>>> likedCars() {
    return _carsDetail.likedCars();
  }

  Future<BaseResult<CarDetailInfoModel>> getCarDetail({required num carId}) {
    return _carsDetail.getCarDetail(
      carId: carId,
    );
  }

  Future<bool> hasUser() {
    return _authRepository.hasUser();
  }

  Future<BaseResult<FilterModel>> filter() {
    return _carsDetail.filter();
  }
}

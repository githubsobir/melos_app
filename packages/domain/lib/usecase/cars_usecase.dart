import 'package:domain/model/cars/car_detail_info_model.dart';
import 'package:domain/model/cars/car_model.dart';
import 'package:domain/repository/cars_repository.dart';
import 'package:domain/utils/base_result.dart';

class CarsUseCase {
  final CarsRepository _carsDetail;

  CarsUseCase(this._carsDetail);

  Future<BaseResult<List<CarModel>>> recommendedCars({required int page}) {
    return _carsDetail.recommendedCars(page: page);
  }

  Future<BaseResult<bool>> likeCar(int id, bool isLiked) {
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
}

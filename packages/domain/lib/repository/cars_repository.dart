import 'package:domain/model/cars/car_detail_info_model.dart';
import 'package:domain/model/cars/car_model.dart';
import 'package:domain/utils/base_result.dart';

abstract class CarsRepository {
  Future<BaseResult<List<CarModel>>> recommendedCars({required int page});

  Future<BaseResult<bool>> likeCar(num id,bool isLiked);

  Future<BaseResult<List<CarModel>>> likedCars();

  Future<BaseResult<CarDetailInfoModel>> getCarDetail({required num carId});

}

import 'package:domain/model/car_model.dart';
import 'package:domain/utils/base_result.dart';

abstract class CarsRepository {
  Future<BaseResult<List<CarModel>>> recommendedCars({required int page});

  Future<BaseResult<bool>> likeCar(int id,bool isLiked);

  Future<BaseResult<List<CarModel>>> likedCars();
// Future<BaseResult<bool>> login({
//   required String phoneNumber,
//   required String password,
// });
}

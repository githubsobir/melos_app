import 'package:domain/model/car_model.dart';
import 'package:domain/utils/base_result.dart';

abstract class CarsRepository {
  Future<BaseResult<CarsModel>> carsList();

  Future<BaseResult<bool>> likeCar(int id);
// Future<BaseResult<bool>> login({
//   required String phoneNumber,
//   required String password,
// });
}

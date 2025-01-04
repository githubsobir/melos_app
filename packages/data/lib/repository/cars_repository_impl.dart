import 'package:data/models/remote/cars/request/car_like_request.dart';
import 'package:data/models/remote/cars/response/car_response.dart';
import 'package:data/service/cars_service.dart';
import 'package:domain/model/car_model.dart';
import 'package:domain/repository/cars_repository.dart';
import 'package:domain/utils/base_result.dart';

class CarsRepositoryImpl extends CarsRepository {
  final CarsService _carsService;

  CarsRepositoryImpl(this._carsService);

  @override
  Future<BaseResult<CarsModel>> carsList() async {
    try {
      var response = await _carsService.carsList();
      return BaseResult(
        success: true,
        body: CarResponse.fromJson(response.data).results?.toDomainModel(),
      );
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<bool>> likeCar(int id) async {
    try {
      var response = await _carsService.likeCar(CarLikeRequest(carId: id));
      return BaseResult(
        success: true,
        body: true,
      );
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }
}

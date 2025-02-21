import 'package:data/models/remote/cars/request/car_like_request.dart';
import 'package:data/models/remote/cars/response/car.dart';
import 'package:data/models/remote/cars/response/car_detail_info_response.dart';
import 'package:data/models/remote/cars/response/car_response.dart';
import 'package:data/models/remote/cars/response/liked_cars_response.dart';
import 'package:data/service/cars_service.dart';
import 'package:data/utils/my_shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/cars/car_detail_info_model.dart';
import 'package:domain/model/cars/car_model.dart';
import 'package:domain/repository/cars_repository.dart';
import 'package:domain/utils/base_result.dart';

class CarsRepositoryImpl extends CarsRepository {
  final CarsService _carsService;

  CarsRepositoryImpl(this._carsService);

  @override
  Future<BaseResult<List<CarModel>>> recommendedCars(
      {required int page}) async {
    try {
      var response = await _carsService.recommendedCars(page: page);
      return BaseResult(
        success: true,
        body: CarResponse.fromJson(response.data)
            .results
            ?.map(
              (e) => e.toDomainModel(),
            )
            .toList(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<bool>> likeCar(num id, bool isLiked) async {
    try {
      if (isLiked) {
        var response = await _carsService.likeCar(CarLikeRequest(carId: id));
      } else {
        var response = await _carsService.removeLikeCar(id);
      }
      return BaseResult(
        success: true,
        body: true,
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<List<CarModel>>> likedCars() async {
    try {
      // await MySharedPref.instance.setAccessToken("token");
      // await MySharedPref.instance.setRefreshToken("token");
      var response = await _carsService.likedCars();
      return BaseResult(
        success: true,
        body: LikedCarsResponse.fromJson(response.data)
            .likedCars
            ?.map((e) => e.toDomainModel())
            .toList(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<CarDetailInfoModel>> getCarDetail(
      {required num carId}) async {
    try {
      var response = await _carsService.getCarDetail(
        carId: carId,
      );
      return BaseResult(
        success: true,
        body: CarDetailInfoResponse.fromJson(response.data).toDomainModel(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }
}

import 'package:data/models/remote/cars/request/car_like_request.dart';
import 'package:data/models/remote/cars/response/car.dart';
import 'package:data/models/remote/cars/response/car_detail_info_response.dart';
import 'package:data/models/remote/cars/response/car_response.dart';
import 'package:data/models/remote/cars/response/filter_response.dart';
import 'package:data/models/remote/cars/response/liked_cars_response.dart';
import 'package:data/models/remote/location/gps_response.dart';
import 'package:data/models/remote/location/map_api_key_response.dart';
import 'package:data/service/cars_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/cars/car_detail_info_model.dart';
import 'package:domain/model/cars/car_model.dart';
import 'package:domain/model/cars/filter_model.dart';
import 'package:domain/model/location/gps_model.dart';
import 'package:domain/repository/cars_repository.dart';
import 'package:domain/utils/base_result.dart';

class CarsRepositoryImpl extends CarsRepository {
  final CarsService _carsService;

  CarsRepositoryImpl(this._carsService);

  @override
  Future<BaseResult<List<CarModel>>> recommendedCars({
    required int page,
    String? startDataTime,
    String? endDataTime,
    String? latitude,
    String? longitude,
    required String search,
    required List<String> category,
    required List<String> passengers,
    required List<String> cities,
  }) async {
    try {
      var response = await _carsService.recommendedCars(
        page: page,
        startDataTime: startDataTime,
        endDataTime: endDataTime,
        latitude: latitude,
        longitude: longitude,
        search: search,
        category: category,
        passengers: passengers,
        cities: cities,
      );
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

  @override
  Future<BaseResult<FilterModel>> filter() async {
    try {
      var response = await _carsService.filter();
      return BaseResult(
        success: true,
        body: FilterResponse.fromJson(response.data).toDomainModel(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<List<CarModel>>> popularCars({
    required int page,
    String? startDataTime,
    String? endDataTime,
    String? latitude,
    String? longitude,
  }) async {
    try {
      var response = await _carsService.popularCars(
        page: page,
        startDataTime: startDataTime,
        endDataTime: endDataTime,
        latitude: latitude,
        longitude: longitude,
      );
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
  Future<BaseResult<List<GpsModel>>> gpsList(
      {double? latitude, double? longitude}) async {
    try {
      var response =
          await _carsService.gpsList(latitude: latitude, longitude: longitude);
      return BaseResult(
        success: true,
        body: GpsResponse.listFromJson(response.data)
            .map(
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
  Future<BaseResult<String>> mapApiKey() async {
    try {
      var response = await _carsService.mapApiKey();
      return BaseResult(
        success: true,
        body: MapApiKeyResponse.fromJson(response.data).key,
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }
}

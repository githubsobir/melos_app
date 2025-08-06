import 'dart:developer';

import 'package:domain/model/cars/car_create_model.dart';
import 'package:domain/model/cars/car_detail_info_model.dart';
import 'package:domain/model/cars/car_model.dart';
import 'package:domain/model/cars/car_step.dart';
import 'package:domain/model/cars/check_date_model.dart';
import 'package:domain/model/cars/current_car_model.dart';
import 'package:domain/model/cars/filter_model.dart';
import 'package:domain/model/cars/my_car_model.dart';
import 'package:domain/model/location/current_gps_model.dart';
import 'package:domain/model/location/gps_model.dart';
import 'package:domain/model/location/nearest_cars_model.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/cars_repository.dart';
import 'package:domain/utils/base_result.dart';

class CarsUseCase {
  final CarsRepository _carsRepository;
  final AuthRepository _authRepository;

  CarsUseCase(this._carsRepository, this._authRepository);

  Future<BaseResult<List<CarModel>>> recommendedCars({
    required int page,
    required int? maxPrice,
    String? startDataTime,
    String? endDataTime,
    String? latitude,
    String? longitude,
    required String search,
    required List<String> category,
    required List<String> passengers,
    required List<String> cities,
  }) {
    return _carsRepository.recommendedCars(
      page: page,
      maxPrice: maxPrice,
      startDataTime: startDataTime,
      endDataTime: endDataTime,
      latitude: latitude,
      longitude: longitude,
      search: search,
      category: category,
      passengers: passengers,
      cities: cities,
    );
  }

  Future<BaseResult<bool>> likeCar(num id, bool isLiked) {
    return _carsRepository.likeCar(id, isLiked);
  }

  Future<BaseResult<List<CarModel>>> likedCars() {
    return _carsRepository.likedCars();
  }

  Future<BaseResult<CarDetailInfoModel>> getCarDetail({required num carId}) {
    return _carsRepository.getCarDetail(
      carId: carId,
    );
  }

  Future<bool> hasUser() {
    return _authRepository.hasUser();
  }

  Future<BaseResult<FilterModel>> filter() async {
    var data = await _carsRepository.filter();
    return data;
  }

  Future<BaseResult<List<CarModel>>> popularCars({
    required int page,
    String? startDataTime,
    String? endDataTime,
    String? latitude,
    String? longitude,
  }) {
    return _carsRepository.popularCars(
      page: page,
      startDataTime: startDataTime,
      endDataTime: endDataTime,
      latitude: latitude,
      longitude: longitude,
    );
  }

  Future<BaseResult<List<GpsModel>>> gpsList(
      {double? latitude, double? longitude}) {
    return _carsRepository.gpsList(latitude: latitude, longitude: longitude);
  }

  Future<BaseResult<String>> mapApiKey() {
    return _carsRepository.mapApiKey();
  }

  Future<BaseResult<bool>> carCreate(
      {required int processNumber, required CarCreateModel carModel}) {
    return _carsRepository.carCreate(
      processNumber: processNumber,
      carModel: carModel,
    );
  }

  Future<BaseResult<List<MyCarModel>>> getMyCars() {
    return _carsRepository.getMyCars();
  }

  Future<BaseResult<String>> geocoder({
    required double latitude,
    required double longitude,
  }) {
    return _carsRepository.geocoder(
      latitude: latitude,
      longitude: longitude,
    );
  }

  Future<BaseResult<List<CurrentCarModel>>> currentCarsOwners() {
    return _carsRepository.currentCarsOwners();
  }

  Future<BaseResult<bool>> changeCarStatus({required num carId}) {
    return _carsRepository.changeCarStatus(carId: carId);
  }

  Future<BaseResult<bool>> onCompleteCar({required num id}) {
    return _carsRepository.onCompleteCar(id: id);
  }

  Future<BaseResult<bool>> deleteCar({required num id}) {
    return _carsRepository.deleteCar(id: id);
  }

  Future<BaseResult<CurrentGpsModel>> gpsLocation({required num id}) {
    return _carsRepository.gpsLocation(id: id);
  }

  Future<BaseResult<bool>> updateCar(
      {required num id,
      required String dailyRate,
      required double latitude,
      required double longitude}) {
    return _carsRepository.updateCar(
      id: id,
      dailyRate: dailyRate,
      latitude: latitude,
      longitude: longitude,
    );
  }

  Future<BaseResult<CheckDateModel>> checkDate(
      {required num carId,
      required String startDate,
      required String endDate}) {
    return _carsRepository.checkDate(
        carId: carId, startDate: startDate, endDate: endDate);
  }

  Future<BaseResult<NearestCarsModel>> nearestCars(
      {required double latitude, required double longitude}) async {
    try {
      var data = await _carsRepository.nearestCars(
        latitude: latitude,
        longitude: longitude,
      );
      return data;
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }

  Future<BaseResult<CarStep1Entities>> carStep1() async {
    try {
      var data = await _carsRepository.carStep1();
      return data;
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }
}

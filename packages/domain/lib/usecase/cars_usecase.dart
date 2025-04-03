import 'package:domain/model/cars/car_create_model.dart';
import 'package:domain/model/cars/car_detail_info_model.dart';
import 'package:domain/model/cars/car_model.dart';
import 'package:domain/model/cars/current_car_model.dart';
import 'package:domain/model/cars/filter_model.dart';
import 'package:domain/model/cars/my_car_model.dart';
import 'package:domain/model/location/gps_model.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/cars_repository.dart';
import 'package:domain/utils/base_result.dart';

class CarsUseCase {
  final CarsRepository _carsRepository;
  final AuthRepository _authRepository;

  CarsUseCase(this._carsRepository, this._authRepository);

  Future<BaseResult<List<CarModel>>> recommendedCars({
    required int page,
    required int maxPrice,
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

  Future<BaseResult<FilterModel>> filter() {
    return _carsRepository.filter();
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
}

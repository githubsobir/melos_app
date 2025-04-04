import 'package:domain/model/cars/car_create_model.dart';
import 'package:domain/model/cars/car_detail_info_model.dart';
import 'package:domain/model/cars/car_model.dart';
import 'package:domain/model/cars/current_car_model.dart';
import 'package:domain/model/cars/filter_model.dart';
import 'package:domain/model/cars/my_car_model.dart';
import 'package:domain/model/location/gps_model.dart';
import 'package:domain/utils/base_result.dart';

abstract class CarsRepository {
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
  });

  Future<BaseResult<bool>> likeCar(num id, bool isLiked);

  Future<BaseResult<List<CarModel>>> likedCars();

  Future<BaseResult<CarDetailInfoModel>> getCarDetail({required num carId});

  Future<BaseResult<FilterModel>> filter();

  Future<BaseResult<List<CarModel>>> popularCars({
    required int page,
    String? startDataTime,
    String? endDataTime,
    String? latitude,
    String? longitude,
  });

  Future<BaseResult<List<GpsModel>>> gpsList(
      {double? latitude, double? longitude});

  Future<BaseResult<String>> mapApiKey();

  Future<BaseResult<bool>> carCreate(
      {required int processNumber, required CarCreateModel carModel});

  Future<BaseResult<List<MyCarModel>>> getMyCars();

  Future<BaseResult<String>> geocoder(
      {required double latitude, required double longitude});

  Future<BaseResult<List<CurrentCarModel>>> currentCarsOwners();

  Future<BaseResult<bool>> changeCarStatus({required num carId});

  Future<BaseResult<bool>> onCompleteCar({required num id});

  Future<BaseResult<bool>> deleteCar({required num id});
}

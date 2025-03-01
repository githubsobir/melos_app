import 'package:domain/model/cars/car_detail_info_model.dart';
import 'package:domain/model/cars/car_model.dart';
import 'package:domain/model/cars/filter_model.dart';
import 'package:domain/model/location/gps_model.dart';
import 'package:domain/utils/base_result.dart';

abstract class CarsRepository {
  Future<BaseResult<List<CarModel>>> recommendedCars({
    required int page,
    String? startDataTime,
    String? endDataTime,
    String? latitude,
    String? longitude,
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

  Future<BaseResult<List<GpsModel>>> gpsList({double? latitude, double? longitude});
}

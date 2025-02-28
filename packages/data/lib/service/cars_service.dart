import 'package:data/models/remote/cars/request/car_like_request.dart';
import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';

class CarsService {
  final NetBase _netBase;

  CarsService(this._netBase);

  Future<Response> recommendedCars({
    required int page,
    String? startDataTime,
    String? endDataTime,
    String? latitude,
    String? longitude,
  }) async {
    Map<String, dynamic> headers = {};
    if (startDataTime != null) {
      headers['start_date_time'] = startDataTime;
    }
    if (endDataTime != null) {
      headers['end_date_time'] = endDataTime;
    }
    if (latitude != null) {
      headers['latitude'] = latitude;
    }
    if (longitude != null) {
      headers['longitude'] = longitude;
    }

    var response = await _netBase.dio.get(
      'cars/list/recommended/?page=$page',
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response> likeCar(CarLikeRequest request) async {
    var response =
        await _netBase.dio.post('liked/create/', data: request.toJson());
    return response;
  }

  Future<Response> removeLikeCar(num carId) async {
    var response = await _netBase.dio.delete('liked/$carId/');
    return response;
  }

  Future<Response> likedCars() async {
    var response = await _netBase.dio.get('liked/list/');
    return response;
  }

  Future<Response> getCarDetail({required num carId}) async {
    var response = await _netBase.dio.get('cars/detail/$carId/');
    return response;
  }

  Future<Response> filter() async {
    var response = await _netBase.dio.get('cars/filter/');
    return response;
  }

  Future<Response> popularCars({
    required int page,
    String? startDataTime,
    String? endDataTime,
    String? latitude,
    String? longitude,
  }) async {
    Map<String, dynamic> headers = {};
    if (startDataTime != null) {
      headers['start_date_time'] = startDataTime;
    }
    if (endDataTime != null) {
      headers['end_date_time'] = endDataTime;
    }
    if (latitude != null) {
      headers['latitude'] = latitude;
    }
    if (longitude != null) {
      headers['longitude'] = longitude;
    }

    var response = await _netBase.dio.get(
      'cars/list/popular/?page=$page',
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }
}

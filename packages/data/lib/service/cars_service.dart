import 'package:data/models/remote/cars/request/car_like_request.dart';
import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';

class CarsService {
  final NetBase _netBase;

  CarsService(this._netBase);

  Future<Response> recommendedCars({required int page}) async {
    var response = await _netBase.dio.get('cars/recommend-cars/?page=$page');
    return response;
  }

  Future<Response> likeCar(CarLikeRequest request) async {
    var response =
        await _netBase.dio.post('cars/like-car/', data: request.toJson());
    return response;
  }

  Future<Response> removeLikeCar(num carId) async {
    var response = await _netBase.dio.delete('cars/remove-like/$carId/');
    return response;
  }

  Future<Response> likedCars() async {
    var response = await _netBase.dio.get('cars/liked-list/');
    return response;
  }

  Future<Response> getCarDetail({required num carId}) async {
    var response = await _netBase.dio.get('cars/detail/$carId/');
    return response;
  }
}

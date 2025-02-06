import 'package:data/models/remote/cars/request/car_like_request.dart';
import 'package:data/network/net_base.dart';
import 'package:data/utils/my_shared_pref.dart';
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

  Future<Response> removeLikeCar(int carId) async {
    var response = await _netBase.dio.delete('cars/remove-like/$carId/');
    return response;
  }

  Future<Response> likedCars() async {
    final token = await MySharedPref.instance.getAccessToken();
    var response = await _netBase.dio.get('cars/liked-list/');
    return response;
  }
}

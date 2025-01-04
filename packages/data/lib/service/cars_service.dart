import 'package:data/models/remote/cars/request/car_like_request.dart';
import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';

class CarsService {
  final NetBase _netBase;

  CarsService(this._netBase);

  Future<Response> carsList() async {
    var response = await _netBase.dio.get('cars/list/');
    return response;
  }

  Future<Response> likeCar(CarLikeRequest request) async {
    var response =
        await _netBase.dio.post('cars/like-car/', data: request.toJson());
    return response;
  }
}

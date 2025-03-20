import 'package:data/models/remote/cars/request/car_like_request.dart';
import 'package:data/network/net_base.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/cars/car_create_model.dart';

class CarsService {
  final NetBase _netBase;

  CarsService(this._netBase);

  Future<Response> recommendedCars({
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

    var query = "";
    if (search.isNotEmpty) {
      query += "&search=$search";
    }

    if (category.isNotEmpty) {
      var categoryList = category
          .toString()
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(" ", "");
      query += "&category=$categoryList";
    }

    if (passengers.isNotEmpty) {
      var passengersList = passengers
          .toString()
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(" ", "");
      query += "&passengers=$passengersList";
    }

    if (cities.isNotEmpty) {
      var citiesList = cities
          .toString()
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll(" ", "");
      query += "&cities=$citiesList";
    }

    var response = await _netBase.dio.get(
      'cars/list/recommended/?page=$page$query',
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

  Future<Response> gpsList({double? latitude, double? longitude}) async {
    var response = await _netBase.dio.get(
      'gps/list/?latitude=$latitude&longitude=$longitude',
    );
    return response;
  }

  Future<Response> mapApiKey() async {
    var response = await _netBase.dio.get(
      'admin/yandex-api/',
    );
    return response;
  }

  Future<Response> carCreate(
      {required int processNumber, required CarCreateModel carModel}) async {
    List<MultipartFile> photos = [];

    for (var path in (carModel.photos ?? [])) {
      photos.add(await MultipartFile.fromFile(path,
          filename: path.substring(path.lastIndexOf("/") + 1)));
    }
    MultipartFile? document;
    if (carModel.document != null) {
      document = await MultipartFile.fromFile(carModel.document!,
          filename: carModel.document!
              .substring(carModel.document!.lastIndexOf("/") + 1));
    }

    var formData = FormData.fromMap({
      "process_number": processNumber,
      "make": carModel.make,
      "model": carModel.model,
      "year": carModel.year,
      "category": carModel.category,
      "fuel_capacity": carModel.fuelCapacity,
      "mileage": carModel.mileage,
      "transmission": carModel.transmission,
      "passenger_capacity": carModel.passengerCapacity,
      "registration_number": carModel.registrationNumber,
      "daily_rate": carModel.dailyRate,
      "original_price": carModel.originalPrice,
      "description": carModel.description,
      "city": carModel.city,
      "port": carModel.port,
      "unique_id": carModel.uniqueId,
      "latitude": carModel.latitude,
      "longitude": carModel.longitude,
      "photos": photos,
      "document": document
    });

    var response = await _netBase.dio.post(
      'cars/create/$processNumber/',
      data: formData,
    );
    return response;
  }

  Future<Response> uploadImage(String path) async {
    var image = await MultipartFile.fromFile(path,
        filename: path.substring(path.lastIndexOf("/") + 1));
    var formData = FormData.fromMap({
      "photo": image,
    });
    var response = await _netBase.dio.post(
      "user/image-upload/",
      data: formData,
    );
    return response;
  }
}

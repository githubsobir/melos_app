import 'package:data/models/remote/cars/response/car.dart';

class LikedCarsResponse {
  LikedCarsResponse({
    this.errorCode,
    this.errorNote,
    this.likedCars,
  });

  LikedCarsResponse.fromJson(dynamic json) {
    errorCode = json['error_code'];
    errorNote = json['error_note'];
    if (json['liked_cars'] != null) {
      likedCars = [];
      json['liked_cars'].forEach((v) {
        likedCars?.add(Car.fromJson(v));
      });
    }
  }

  num? errorCode;
  String? errorNote;
  List<Car>? likedCars;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error_code'] = errorCode;
    map['error_note'] = errorNote;
    if (likedCars != null) {
      map['liked_cars'] = likedCars?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

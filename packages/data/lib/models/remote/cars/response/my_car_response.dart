import 'package:domain/model/cars/my_car_model.dart';

class MyCarResponse {
  MyCarResponse({
    this.id,
    this.make,
    this.model,
    this.year,
    this.status,
    this.photo,
  });

  MyCarResponse.fromJson(dynamic json) {
    id = json['id'];
    make = json['make'];
    model = json['model'];
    year = json['year'];
    status = json['status'];
    photo = json['photo'];
  }

  num? id;
  String? make;
  String? model;
  num? year;
  String? status;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['make'] = make;
    map['model'] = model;
    map['year'] = year;
    map['status'] = status;
    map['photo'] = photo;
    return map;
  }

  static List<MyCarResponse> listFromJson(dynamic json) {
    return (json as List).map((i) => MyCarResponse.fromJson(i)).toList();
  }
}

extension MyCarMapper on MyCarResponse {
  MyCarModel toDomainModel() {
    return MyCarModel(
      id: id,
      make: make,
      model: model,
      year: year,
      status: status,
      photo: photo,
    );
  }
}

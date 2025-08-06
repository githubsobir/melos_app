import 'package:domain/model/cars/my_car_model.dart';

class MyCarResponse {
  MyCarResponse({
    this.id,
    this.make,
    this.model,
    this.year,
    this.isActive,
    this.photo,
    this.dailyRate,
  });

  MyCarResponse.fromJson(dynamic json) {
    id = json['id'];
    make = json['make'];
    model = json['model'];
    year = json['year'];
    isActive = json['is_active'];
    photo = json['photo'];
    dailyRate = json['daily_rate'];
  }

  num? id;
  String? make;
  String? model;
  num? year;
  bool? isActive;
  String? photo;
  String? dailyRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['make'] = make;
    map['model'] = model;
    map['year'] = year;
    map['is_active'] = isActive;
    map['photo'] = photo;
    map['daily_rate'] = dailyRate;
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
      isActive: isActive,
      photo: photo,
      dailyRate: dailyRate,
    );
  }
}

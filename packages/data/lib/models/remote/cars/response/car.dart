import 'package:domain/model/cars/car_model.dart';

class Car {
  Car({
    this.id,
    this.make,
    this.category,
    this.fuelCapacity,
    this.transmission,
    this.passengerCapacity,
    this.dailyRate,
    this.originalPrice,
    this.photo,
    this.liked,
  });

  Car.fromJson(dynamic json) {
    id = json['id'];
    make = json['make'];
    category = json['category'];
    fuelCapacity = json['fuel_capacity'];
    transmission = json['transmission'];
    passengerCapacity = json['passenger_capacity'];
    dailyRate = json['daily_rate'];
    originalPrice = json['original_price'];
    photo = json['photo'];
    liked = json['liked'];
  }

  num? id;
  String? make;
  String? category;
  num? fuelCapacity;
  String? transmission;
  num? passengerCapacity;
  String? dailyRate;
  String? originalPrice;
  String? photo;
  bool? liked;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['make'] = make;
    map['category'] = category;
    map['fuel_capacity'] = fuelCapacity;
    map['transmission'] = transmission;
    map['passenger_capacity'] = passengerCapacity;
    map['daily_rate'] = dailyRate;
    map['original_price'] = originalPrice;
    map['photo'] = photo;
    map['liked'] = liked;
    return map;
  }

  static List<Car> listFromJson(dynamic json) {
    return (json as List).map((i) => Car.fromJson(i)).toList();
  }
}

extension CarMapper on Car {
  CarModel toDomainModel() {
    return CarModel(
      id: id,
      category: category,
      dailyRate: dailyRate,
      photo: photo,
      fuelCapacity: fuelCapacity,
      make: make,
      originalPrice: originalPrice,
      passengerCapacity: passengerCapacity,
      transmission: transmission,
      liked: liked,
    );
  }
}

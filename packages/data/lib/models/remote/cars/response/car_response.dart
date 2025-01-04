import 'package:domain/model/car_model.dart';

class CarResponse {
  CarResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  CarResponse.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  num? count;
  String? next;
  String? previous;
  Results? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['next'] = next;
    map['previous'] = previous;
    if (results != null) {
      map['results'] = results?.toJson();
    }
    return map;
  }
}

class Results {
  Results({
    this.recommendedCars,
    this.carsList,
  });

  Results.fromJson(dynamic json) {
    if (json['recommended_cars'] != null) {
      recommendedCars = [];
      json['recommended_cars'].forEach((v) {
        recommendedCars?.add(Car.fromJson(v));
      });
    }
    if (json['cars_list'] != null) {
      carsList = [];
      json['cars_list'].forEach((v) {
        carsList?.add(Car.fromJson(v));
      });
    }
  }

  List<Car>? recommendedCars;
  List<Car>? carsList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (recommendedCars != null) {
      map['recommended_cars'] =
          recommendedCars?.map((v) => v.toJson()).toList();
    }
    if (carsList != null) {
      map['cars_list'] = carsList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

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
    this.firstPhotoUrl,
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
    firstPhotoUrl = json['first_photo_url'];
  }

  num? id;
  String? make;
  String? category;
  num? fuelCapacity;
  String? transmission;
  num? passengerCapacity;
  num? dailyRate;
  num? originalPrice;
  String? firstPhotoUrl;

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
    map['first_photo_url'] = firstPhotoUrl;
    return map;
  }
}

extension CarMapper on Car {
  CarModel toDomainModel() {
    return CarModel(
      id: id,
      category: category,
      dailyRate: dailyRate,
      firstPhotoUrl: firstPhotoUrl,
      fuelCapacity: fuelCapacity,
      make: make,
      originalPrice: originalPrice,
      passengerCapacity: passengerCapacity,
      transmission: transmission,
    );
  }
}

extension ResultsMapper on Results {
  CarsModel toDomainModel() {
    return CarsModel(
      carsList: (carsList ?? [])
          .map(
            (e) => e.toDomainModel(),
          )
          .toList(),
      recommendCars: (recommendedCars ?? [])
          .map(
            (e) => e.toDomainModel(),
          )
          .toList(),
    );
  }
}

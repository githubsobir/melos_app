import 'package:domain/model/location/gps_model.dart';

class GpsResponse {
  GpsResponse({
    this.id,
    this.photo,
    this.make,
    this.model,
    this.address,
    this.price,
    this.rating,
    this.longitude,
    this.latitude,
  });

  GpsResponse.fromJson(dynamic json) {
    id = json['id'];
    photo = json['photo'];
    make = json['make'];
    model = json['model'];
    address = json['address'];
    price = json['price'];
    rating = json['rating'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  int? id;
  String? photo;
  String? make;
  String? model;
  String? address;
  String? price;
  double? rating;
  double? longitude;
  double? latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['photo'] = photo;
    map['make'] = make;
    map['model'] = model;
    map['address'] = address;
    map['price'] = price;
    map['rating'] = rating;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    return map;
  }

  static List<GpsResponse> listFromJson(dynamic json) {
    return (json as List).map((i) => GpsResponse.fromJson(i)).toList();
  }
}

extension GpsMapper on GpsResponse {
  GpsModel toDomainModel() {
    return GpsModel(
      id: id,
      photo: photo,
      make: make,
      model: model,
      address: address,
      rating: rating,
      latitude: latitude,
      longitude: longitude,
      price: price
    );
  }
}

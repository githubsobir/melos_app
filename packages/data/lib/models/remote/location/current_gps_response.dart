import 'package:domain/model/location/current_gps_model.dart';

class CurrentGpsResponse {
  CurrentGpsResponse({
    this.id,
    this.address,
    this.longitude,
    this.latitude,
    this.speed,
    this.fuelCapacity,
  });

  CurrentGpsResponse.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    speed = json['speed'];
    fuelCapacity = json['fuel_capacity'];
  }

  num? id;
  String? address;
  num? longitude;
  num? latitude;
  String? speed;
  String? fuelCapacity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    map['speed'] = speed;
    map['fuel_capacity'] = fuelCapacity;
    return map;
  }
}

extension GpsMapper on CurrentGpsResponse {
  CurrentGpsModel toDomainModel() {
    return CurrentGpsModel(
        id: id,
        latitude: latitude,
        longitude: longitude,
        address: address,
        fuelCapacity: fuelCapacity,
        speed: speed);
  }
}

import 'package:data/models/remote/location/gps_response.dart';
import 'package:domain/model/location/nearest_cars_model.dart';

class NearestCarResponse {
  NearestCarResponse({
    this.nearest,
    this.others,
  });

  NearestCarResponse.fromJson(dynamic json) {
    if (json['nearest'] != null) {
      nearest = [];
      json['nearest'].forEach((v) {
        nearest?.add(GpsResponse.fromJson(v));
      });
    }
    if (json['others'] != null) {
      others = [];
      json['others'].forEach((v) {
        others?.add(GpsResponse.fromJson(v));
      });
    }
  }

  List<GpsResponse>? nearest;
  List<GpsResponse>? others;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (nearest != null) {
      map['nearest'] = nearest?.map((v) => v.toJson()).toList();
    }
    if (others != null) {
      map['others'] = others?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

extension NearestCarMapper on NearestCarResponse {
  NearestCarsModel toDomainModel() {
    return NearestCarsModel(
      nearest: nearest?.map((e) => e.toDomainModel()).toList(),
      others: others?.map((e) => e.toDomainModel()).toList(),
    );
  }
}

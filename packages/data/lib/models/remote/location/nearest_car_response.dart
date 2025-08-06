import 'package:data/models/remote/cars/response/filter_response.dart';
import 'package:data/models/remote/location/gps_response.dart';
import 'package:domain/model/cars/filter_model.dart';
import 'package:domain/model/location/nearest_cars_model.dart';
import 'package:flutter/foundation.dart';

class MainNearestCarResponse {
  MainNearestCarResponse({
    this.errorCode,
    this.errorNote,
    required this.nearest,
  });

  dynamic errorCode;
  dynamic errorNote;
  NearestCarResponse nearest;

  factory MainNearestCarResponse.fromJson(Map<String, dynamic> json) => MainNearestCarResponse(
    errorCode: json["error_code"],
    errorNote: json["error_note"],
    nearest: NearestCarResponse.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error_code": errorCode,
    "error_note": errorNote,
    "data": nearest.toJson(),
  };



}

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
import 'package:data/models/remote/cars/response/car.dart';


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
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Car.fromJson(v));
      });
    }
  }

  num? count;
  String? next;
  String? previous;
  List<Car>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['next'] = next;
    map['previous'] = previous;
    if (results != null) {
      map['recommended_cars'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CarLikeRequest {
  CarLikeRequest({
    this.carId,
  });

  CarLikeRequest.fromJson(dynamic json) {
    carId = json['car_id'];
  }

  num? carId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['car_id'] = carId;
    return map;
  }
}

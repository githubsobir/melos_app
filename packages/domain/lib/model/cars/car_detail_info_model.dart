import 'package:domain/model/cars/car_model.dart';

class CarDetailInfoModel {
  CarDetailInfoModel({
    this.id,
    this.make,
    this.model,
    this.year,
    this.category,
    this.fuelCapacity,
    this.transmission,
    this.passengerCapacity,
    this.registrationNumber,
    this.status,
    this.dailyRate,
    this.originalPrice,
    this.description,
    this.createdAt,
    this.photos,
    this.liked,
    this.reviews,
    this.averageRating,
    this.url,
    this.recommendCars,
    this.reviewsCount,
  });

  num? id;
  String? make;
  String? model;
  num? year;
  String? category;
  num? fuelCapacity;
  String? transmission;
  num? passengerCapacity;
  String? registrationNumber;
  String? status;
  String? dailyRate;
  String? originalPrice;
  String? description;
  String? createdAt;
  List<String>? photos;
  bool? liked;
  List<ReviewsModel>? reviews;
  num? averageRating;
  String? url;
  List<CarModel>? recommendCars;
  num? reviewsCount;
}

class ReviewsModel {
  ReviewsModel({
    this.clientName,
    this.comment,
    this.rating,
    this.reviewDate,
    this.clientImage,
  });

  ReviewsModel.fromJson(dynamic json) {
    clientName = json['client_name'];
    comment = json['comment'];
    rating = json['rating'];
    reviewDate = json['review_date'];
    clientImage = json['client_image'];
  }

  String? clientName;
  String? comment;
  num? rating;
  String? reviewDate;
  String? clientImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_name'] = clientName;
    map['comment'] = comment;
    map['rating'] = rating;
    map['review_date'] = reviewDate;
    map['client_image'] = clientImage;
    return map;
  }
}

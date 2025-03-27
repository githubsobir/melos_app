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
    this.address,
    this.addressLink,
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
  String? address;
  String? addressLink;
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

  String? clientName;
  String? comment;
  num? rating;
  String? reviewDate;
  String? clientImage;
}

import 'package:data/models/remote/cars/response/car.dart';
import 'package:domain/model/cars/car_detail_info_model.dart';

class CarDetailInfoResponse {
  CarDetailInfoResponse({
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

  CarDetailInfoResponse.fromJson(dynamic json) {
    id = json['id'];
    make = json['make'];
    model = json['model'];
    year = json['year'];
    category = json['category'];
    fuelCapacity = json['fuel_capacity'];
    transmission = json['transmission'];
    passengerCapacity = json['passenger_capacity'];
    registrationNumber = json['registration_number'];
    status = json['status'];
    dailyRate = json['daily_rate'];
    originalPrice = json['original_price'];
    description = json['description'];
    createdAt = json['created_at'];
    photos = json['photos'] != null ? json['photos'].cast<String>() : [];
    liked = json['liked'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
    averageRating = json['average_rating'];
    url = json['url'];
    if (json['recommend_cars'] != null) {
      recommendCars = [];
      json['recommend_cars'].forEach((v) {
        recommendCars?.add(Car.fromJson(v));
      });
    }
    reviewsCount = json['reviews_count'];
  }

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
  List<Reviews>? reviews;
  num? averageRating;
  String? url;
  List<Car>? recommendCars;
  num? reviewsCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['make'] = make;
    map['model'] = model;
    map['year'] = year;
    map['category'] = category;
    map['fuel_capacity'] = fuelCapacity;
    map['transmission'] = transmission;
    map['passenger_capacity'] = passengerCapacity;
    map['registration_number'] = registrationNumber;
    map['status'] = status;
    map['daily_rate'] = dailyRate;
    map['original_price'] = originalPrice;
    map['description'] = description;
    map['created_at'] = createdAt;
    map['photos'] = photos;
    map['liked'] = liked;
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    map['average_rating'] = averageRating;
    map['url'] = url;
    if (recommendCars != null) {
      map['recommend_cars'] = recommendCars?.map((v) => v.toJson()).toList();
    }
    map['reviews_count'] = reviewsCount;
    return map;
  }
}

extension CarDetailMapper on CarDetailInfoResponse {
  CarDetailInfoModel toDomainModel() {
    return CarDetailInfoModel(
      liked: liked,
      id: id,
      make: make,
      model: model,
      year: year,
      category: category,
      fuelCapacity: fuelCapacity,
      transmission: transmission,
      passengerCapacity: passengerCapacity,
      registrationNumber: registrationNumber,
      originalPrice: originalPrice,
      status: status,
      dailyRate: dailyRate,
      description: description,
      createdAt: createdAt,
      photos: photos,
      reviews: reviews?.map((e) => e.toDomainModel()).toList(),
      averageRating: averageRating,
      url: url,
      recommendCars: recommendCars?.map((e) => e.toDomainModel()).toList(),
      reviewsCount: reviewsCount,
    );
  }
}

class Reviews {
  Reviews({
    this.clientName,
    this.comment,
    this.rating,
    this.reviewDate,
    this.clientImage,
  });

  Reviews.fromJson(dynamic json) {
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

extension ReviewsMapper on Reviews {
  ReviewsModel toDomainModel() {
    return ReviewsModel(
      clientName: clientName,
      comment: comment,
      rating: rating,
      reviewDate: reviewDate,
      clientImage: clientImage,
    );
  }
}

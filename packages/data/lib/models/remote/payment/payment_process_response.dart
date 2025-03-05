import 'package:domain/model/payment/payment_process_model.dart';

class PaymentProcessResponse {
  PaymentProcessResponse({
    this.id,
    this.make,
    this.model,
    this.year,
    this.dailyRate,
    this.photo,
    this.totalRate,
    this.securityDeposit,
    this.url,
    this.day,
    this.liked,
  });

  PaymentProcessResponse.fromJson(dynamic json) {
    id = json['id'];
    make = json['make'];
    model = json['model'];
    year = json['year'];
    dailyRate = json['daily_rate'];
    photo = json['photo'];
    totalRate = json['total_rate'];
    securityDeposit = json['security_deposit'];
    url = json['url'];
    day = json['day'];
    liked = json['liked'];
  }

  num? id;
  String? make;
  String? model;
  num? year;
  String? dailyRate;
  String? photo;
  num? totalRate;
  String? securityDeposit;
  String? url;
  num? day;
  bool? liked;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['make'] = make;
    map['model'] = model;
    map['year'] = year;
    map['daily_rate'] = dailyRate;
    map['photo'] = photo;
    map['total_rate'] = totalRate;
    map['security_deposit'] = securityDeposit;
    map['url'] = url;
    map['day'] = day;
    map['liked'] = liked;
    return map;
  }
}

extension PaymentProcessMapper on PaymentProcessResponse {
  PaymentProcessModel toDomainModel() {
    return PaymentProcessModel(
      id: id,
      make: make,
      model: model,
      year: year,
      dailyRate: dailyRate,
      photo: photo,
      totalRate: totalRate,
      securityDeposit: securityDeposit,
      url: url,
      day: day,
      liked: liked,
    );
  }
}

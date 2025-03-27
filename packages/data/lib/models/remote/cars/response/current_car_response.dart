import 'package:domain/model/cars/current_car_model.dart';

class CurrentCarResponse {
  CurrentCarResponse({
    this.id,
    this.photo,
    this.startDate,
    this.endDate,
    this.totalAmount,
    this.dailyRate,
    this.securityDeposit,
    this.status,
  });

  CurrentCarResponse.fromJson(dynamic json) {
    id = json['id'];
    photo = json['photo'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    totalAmount = json['total_amount'];
    dailyRate = json['daily_rate'];
    securityDeposit = json['security_deposit'];
    status = json['status'];
  }

  num? id;
  String? photo;
  String? startDate;
  String? endDate;
  String? totalAmount;
  String? dailyRate;
  String? securityDeposit;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['photo'] = photo;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['total_amount'] = totalAmount;
    map['daily_rate'] = dailyRate;
    map['security_deposit'] = securityDeposit;
    map['status'] = status;
    return map;
  }

  static List<CurrentCarResponse> listFromJson(dynamic json) {
    return (json as List).map((i) => CurrentCarResponse.fromJson(i)).toList();
  }
}

extension CurrentCarMapper on CurrentCarResponse {
  CurrentCarModel toDomainModel() {
    return CurrentCarModel(
      id: id,
      photo: photo,
      startDate: startDate,
      endDate: endDate,
      totalAmount: totalAmount,
      dailyRate: dailyRate,
      securityDeposit: securityDeposit,
      status: status,
    );
  }
}

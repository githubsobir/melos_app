import 'package:domain/model/booking/booking_current_model.dart';

class BookingCurrentResponse {
  BookingCurrentResponse({
    this.id,
    this.photos,
    this.startDate,
    this.endDate,
    this.dailyRate,
    this.securityDeposit,
    this.totalAmount,
    this.status,
  });

  BookingCurrentResponse.fromJson(dynamic json) {
    id = json['id'];
    photos = json['photos'] != null ? json['photos'].cast<String>() : [];
    startDate = json['start_date'];
    endDate = json['end_date'];
    dailyRate = json['daily_rate'];
    securityDeposit = json['security_deposit'];
    totalAmount = json['total_amount'];
    status = json['status'];
  }

  num? id;
  List<String>? photos;
  String? startDate;
  String? endDate;
  String? dailyRate;
  String? securityDeposit;
  String? totalAmount;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['photos'] = photos;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['daily_rate'] = dailyRate;
    map['security_deposit'] = securityDeposit;
    map['total_amount'] = totalAmount;
    map['status'] = status;
    return map;
  }

  static List<BookingCurrentResponse> listFromJson(dynamic json) {
    return (json as List)
        .map((i) => BookingCurrentResponse.fromJson(i))
        .toList();
  }
}

extension BookingCurrentMapper on BookingCurrentResponse {
  BookingCurrentModel toDomainModel() {
    return BookingCurrentModel(
      id: id,
      photos: photos,
      startDate: startDate,
      endDate: endDate,
      dailyRate: dailyRate,
      securityDeposit: securityDeposit,
      totalAmount: totalAmount,
      status: status,
    );
  }
}

import 'package:domain/model/booking/booking_history_model.dart';

class BookingHistoryResponse {
  BookingHistoryResponse({
    this.id,
    this.make,
    this.model,
    this.year,
    this.startDate,
    this.endDate,
    this.photo,
  });

  BookingHistoryResponse.fromJson(dynamic json) {
    id = json['id'];
    make = json['make'];
    model = json['model'];
    year = json['year'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    photo = json['photo'];
  }

  num? id;
  String? make;
  String? model;
  String? year;
  String? startDate;
  String? endDate;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['make'] = make;
    map['model'] = model;
    map['year'] = year;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['photo'] = photo;
    return map;
  }

  static List<BookingHistoryResponse> listFromJson(dynamic json) {
    return (json as List)
        .map((i) => BookingHistoryResponse.fromJson(i))
        .toList();
  }
}

extension BookingHistoryMapper on BookingHistoryResponse {
  BookingHistoryModel toDomainModel() {
    return BookingHistoryModel(
      id: id,
      year: year,
      startDate: startDate,
      model: model,
      make: make,
      endDate: endDate,
      photo: photo,
    );
  }
}

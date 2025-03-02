import 'package:domain/model/booking/booking_model.dart';

class BookingResponse {
  BookingResponse({
    this.id,
    this.make,
    this.model,
    this.year,
    this.photos,
    this.startDate,
    this.endDate,
    this.carOwner,
    this.ownerPhoneNumber,
    this.registrationNumber,
    this.profilePage,
    this.dailyRate,
    this.securityDeposit,
    this.totalAmount,
    this.status,
    this.powerOfAttorney,
    this.contract,
    this.insurance,
  });

  BookingResponse.fromJson(dynamic json) {
    id = json['id'];
    make = json['make'];
    model = json['model'];
    year = json['year'];
    photos = json['photos'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    carOwner = json['car_owner'];
    ownerPhoneNumber = json['owner_phone_number'];
    registrationNumber = json['registration_number'];
    profilePage = json['profile_page'];
    dailyRate = json['daily_rate'];
    securityDeposit = json['security_deposit'];
    totalAmount = json['total_amount'];
    status = json['status'];
    powerOfAttorney = json['power_of_attorney'];
    contract = json['contract'];
    insurance = json['insurance'];
  }

  num? id;
  String? make;
  String? model;
  String? year;
  String? photos;
  String? startDate;
  String? endDate;
  String? carOwner;
  String? ownerPhoneNumber;
  String? registrationNumber;
  String? profilePage;
  String? dailyRate;
  String? securityDeposit;
  String? totalAmount;
  String? status;
  String? powerOfAttorney;
  String? contract;
  String? insurance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['make'] = make;
    map['model'] = model;
    map['year'] = year;
    map['photos'] = photos;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['car_owner'] = carOwner;
    map['owner_phone_number'] = ownerPhoneNumber;
    map['registration_number'] = registrationNumber;
    map['profile_page'] = profilePage;
    map['daily_rate'] = dailyRate;
    map['security_deposit'] = securityDeposit;
    map['total_amount'] = totalAmount;
    map['status'] = status;
    map['power_of_attorney'] = powerOfAttorney;
    map['contract'] = contract;
    map['insurance'] = insurance;
    return map;
  }

  static List<BookingResponse> listFromJson(dynamic json) {
    return (json as List).map((i) => BookingResponse.fromJson(i)).toList();
  }
}

extension BookingMapper on BookingResponse {
  BookingModel toDomainModel() {
    return BookingModel(
      id: id,
      carOwner: carOwner,
      contract: contract,
      dailyRate: dailyRate,
      endDate: endDate,
      insurance: insurance,
      make: make,
      model: model,
      ownerPhoneNumber: ownerPhoneNumber,
      photos: photos,
      powerOfAttorney: powerOfAttorney,
      profilePage: profilePage,
      registrationNumber: registrationNumber,
      securityDeposit: securityDeposit,
      startDate: startDate,
      status: status,
      totalAmount: totalAmount,
      year: year,
    );
  }
}

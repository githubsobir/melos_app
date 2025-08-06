import 'package:domain/model/booking/booking_model.dart';

// class BookingResponse {
//   BookingResponse({
//     this.id,
//     this.photos,
//     this.make,
//     this.model,
//     this.registrationNumber,
//     this.carOwner,
//     this.ownerPhoneNumber,
//     this.profilePage,
//     this.dailyRate,
//     this.securityDeposit,
//     this.totalAmount,
//     this.startDate,
//     this.endDate,
//     this.status,
//     this.powerOfAttorney,
//     this.contract,
//     this.insurance,
//   });
//
//   BookingResponse.fromJson(dynamic json) {
//     id = json['id'];
//     photos = json['photos'] != null ? json['photos'].cast<String>() : [];
//     make = json['make'];
//     model = json['model'];
//     registrationNumber = json['registration_number'];
//     carOwner = json['car_owner'];
//     ownerPhoneNumber = json['owner_phone_number'];
//     profilePage = json['profile_page'];
//     dailyRate = json['daily_rate'];
//     securityDeposit = json['security_deposit'];
//     totalAmount = json['total_amount'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     status = json['status'];
//     powerOfAttorney = json['power_of_attorney'];
//     contract = json['contract'];
//     insurance = json['insurance'];
//   }
//
//   num? id;
//   List<String>? photos;
//   String? make;
//   String? model;
//   String? registrationNumber;
//   String? carOwner;
//   String? ownerPhoneNumber;
//   String? profilePage;
//   String? dailyRate;
//   String? securityDeposit;
//   String? totalAmount;
//   String? startDate;
//   String? endDate;
//   String? status;
//   String? powerOfAttorney;
//   List<dynamic>? contract;
//   String? insurance;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['photos'] = photos;
//     map['make'] = make;
//     map['model'] = model;
//     map['registration_number'] = registrationNumber;
//     map['car_owner'] = carOwner;
//     map['owner_phone_number'] = ownerPhoneNumber;
//     map['profile_page'] = profilePage;
//     map['daily_rate'] = dailyRate;
//     map['security_deposit'] = securityDeposit;
//     map['total_amount'] = totalAmount;
//     map['start_date'] = startDate;
//     map['end_date'] = endDate;
//     map['status'] = status;
//     map['power_of_attorney'] = powerOfAttorney;
//     map['contract'] = contract;
//     map['insurance'] = insurance;
//     return map;
//   }
//
//   static List<BookingResponse> listFromJson(dynamic json) {
//     return (json as List).map((i) => BookingResponse.fromJson(i)).toList();
//   }
// }


class BookingResponse {
  int id;
  List<String> photos;
  String make;
  String model;
  String registrationNumber;
  String carOwner;
  String ownerPhoneNumber;
  String profilePage;
  String dailyRate;
  String securityDeposit;
  String totalAmount;
  String startDate;
  String endDate;
  String status;
  dynamic powerOfAttorney;
  List<dynamic> contract;
  dynamic insurance;

  BookingResponse({
    required this.id,
    required this.photos,
    required this.make,
    required this.model,
    required this.registrationNumber,
    required this.carOwner,
    required this.ownerPhoneNumber,
    required this.profilePage,
    required this.dailyRate,
    required this.securityDeposit,
    required this.totalAmount,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.powerOfAttorney,
    required this.contract,
    required this.insurance,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) => BookingResponse(
    id: json["id"],
    photos: List<String>.from(json["photos"].map((x) => x)),
    make: json["make"],
    model: json["model"],
    registrationNumber: json["registration_number"],
    carOwner: json["car_owner"],
    ownerPhoneNumber: json["owner_phone_number"],
    profilePage: json["profile_page"],
    dailyRate: json["daily_rate"],
    securityDeposit: json["security_deposit"],
    totalAmount: json["total_amount"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    status: json["status"],
    powerOfAttorney: json["power_of_attorney"],
    contract: List<dynamic>.from(json["contract"].map((x) => x)),
    insurance: json["insurance"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "photos": List<dynamic>.from(photos.map((x) => x)),
    "make": make,
    "model": model,
    "registration_number": registrationNumber,
    "car_owner": carOwner,
    "owner_phone_number": ownerPhoneNumber,
    "profile_page": profilePage,
    "daily_rate": dailyRate,
    "security_deposit": securityDeposit,
    "total_amount": totalAmount,
    "start_date": startDate,
    "end_date": endDate,
    "status": status,
    "power_of_attorney": powerOfAttorney,
    "contract": List<dynamic>.from(contract.map((x) => x)),
    "insurance": insurance,
  };


  static List<BookingResponse> listFromJson(dynamic json) {
    return (json as List)
        .map((i) => BookingResponse.fromJson(i))
        .toList();
  }
}
extension BookingMapper on BookingResponse {
  BookingModel toDomainModel() {
    return BookingModel(
      id: id,
      make: make,
      model: model,
      registrationNumber: registrationNumber,
      photos: photos,
      dailyRate: dailyRate,
      securityDeposit: securityDeposit,
      totalAmount: totalAmount,
      startDate: startDate,
      endDate: endDate,
      status: status,
      powerOfAttorney: powerOfAttorney,
      contract: contract,
      insurance: insurance,
      carOwner: carOwner,
      ownerPhoneNumber: ownerPhoneNumber,
      profilePage: profilePage,
    );
  }
}

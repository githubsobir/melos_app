import 'package:domain/model/contracts/contract_model.dart';

class ContractResponse {
  ContractResponse({
    this.id,
    this.photos,
    this.carOwner,
    this.ownerPhoneNumber,
    this.profilePage,
    this.dailyRate,
    this.securityDeposit,
    this.totalAmount,
    this.rentalDays,
    this.addressLink,
  });

  ContractResponse.fromJson(dynamic json) {
    id = json['id'];
    photos = json['photos'] != null ? json['photos'].cast<String>() : [];
    carOwner = json['car_owner'];
    ownerPhoneNumber = json['owner_phone_number'];
    profilePage = json['profile_page'];
    dailyRate = json['daily_rate'];
    securityDeposit = json['security_deposit'];
    totalAmount = json['total_amount'];
    rentalDays = json['rental_days'];
    addressLink = json['address_link'];
  }

  num? id;
  List<String>? photos;
  String? carOwner;
  String? ownerPhoneNumber;
  String? profilePage;
  String? dailyRate;
  String? securityDeposit;
  String? totalAmount;
  num? rentalDays;
  String? addressLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['photos'] = photos;
    map['car_owner'] = carOwner;
    map['owner_phone_number'] = ownerPhoneNumber;
    map['profile_page'] = profilePage;
    map['daily_rate'] = dailyRate;
    map['security_deposit'] = securityDeposit;
    map['total_amount'] = totalAmount;
    map['rental_days'] = rentalDays;
    map['address_link'] = addressLink;
    return map;
  }
}

extension ContactMapper on ContractResponse {
  ContractModel toDomainModel() {
    return ContractModel(
      id: id,
      photos: photos,
      carOwner: carOwner,
      ownerPhoneNumber: ownerPhoneNumber,
      profilePage: profilePage,
      dailyRate: dailyRate,
      securityDeposit: securityDeposit,
      totalAmount: totalAmount,
      rentalDays: rentalDays,
      addressLink: addressLink,
    );
  }
}

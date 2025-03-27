class BookingResponse {
  BookingResponse({
    this.id,
    this.photos,
    this.make,
    this.model,
    this.registrationNumber,
    this.carOwner,
    this.ownerPhoneNumber,
    this.profilePage,
    this.dailyRate,
    this.securityDeposit,
    this.totalAmount,
    this.startDate,
    this.endDate,
    this.status,
    this.powerOfAttorney,
    this.contract,
    this.insurance,
  });

  BookingResponse.fromJson(dynamic json) {
    id = json['id'];
    photos = json['photos'] != null ? json['photos'].cast<String>() : [];
    make = json['make'];
    model = json['model'];
    registrationNumber = json['registration_number'];
    carOwner = json['car_owner'];
    ownerPhoneNumber = json['owner_phone_number'];
    profilePage = json['profile_page'];
    dailyRate = json['daily_rate'];
    securityDeposit = json['security_deposit'];
    totalAmount = json['total_amount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    powerOfAttorney = json['power_of_attorney'];
    contract = json['contract'];
    insurance = json['insurance'];
  }

  num? id;
  List<String>? photos;
  String? make;
  String? model;
  String? registrationNumber;
  String? carOwner;
  String? ownerPhoneNumber;
  String? profilePage;
  String? dailyRate;
  String? securityDeposit;
  String? totalAmount;
  String? startDate;
  String? endDate;
  String? status;
  String? powerOfAttorney;
  String? contract;
  String? insurance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['photos'] = photos;
    map['make'] = make;
    map['model'] = model;
    map['registration_number'] = registrationNumber;
    map['car_owner'] = carOwner;
    map['owner_phone_number'] = ownerPhoneNumber;
    map['profile_page'] = profilePage;
    map['daily_rate'] = dailyRate;
    map['security_deposit'] = securityDeposit;
    map['total_amount'] = totalAmount;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['status'] = status;
    map['power_of_attorney'] = powerOfAttorney;
    map['contract'] = contract;
    map['insurance'] = insurance;
    return map;
  }
}

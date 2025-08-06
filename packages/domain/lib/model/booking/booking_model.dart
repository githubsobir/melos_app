class BookingModel {
  BookingModel({
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
  List<dynamic>? contract;
  String? insurance;
}

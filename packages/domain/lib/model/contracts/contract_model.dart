class ContractModel {
  ContractModel({
    this.id,
    this.photos,
    this.carOwner,
    this.ownerPhoneNumber,
    this.profilePage,
    this.dailyRate,
    this.securityDeposit,
    this.totalAmount,
    this.rentalDays,
    this.address,
    this.addressLink,
  });

  num? id;
  List<String>? photos;
  String? carOwner;
  String? ownerPhoneNumber;
  String? profilePage;
  String? dailyRate;
  String? securityDeposit;
  String? totalAmount;
  num? rentalDays;
  String? address;
  String? addressLink;
}

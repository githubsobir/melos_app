class PaymentProcessModel {
  PaymentProcessModel({
    this.id,
    this.make,
    this.model,
    this.year,
    this.dailyRate,
    this.photo,
    this.totalAmount,
    this.securityDeposit,
    this.url,
    this.day,
    this.liked,
  });

  num? id;
  String? make;
  String? model;
  num? year;
  String? dailyRate;
  String? photo;
  num? totalAmount;
  String? securityDeposit;
  String? url;
  num? day;
  bool? liked;
}

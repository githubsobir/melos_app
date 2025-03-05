class PaymentProcessModel {
  PaymentProcessModel({
    this.id,
    this.make,
    this.model,
    this.year,
    this.dailyRate,
    this.photo,
    this.totalRate,
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
  String? totalRate;
  String? securityDeposit;
  String? url;
  String? day;
  String? liked;
}

class BookingCurrentModel {
  BookingCurrentModel({
    this.id,
    this.photos,
    this.startDate,
    this.endDate,
    this.dailyRate,
    this.securityDeposit,
    this.totalAmount,
    this.status,
  });

  num? id;
  List<String>? photos;
  String? startDate;
  String? endDate;
  String? dailyRate;
  String? securityDeposit;
  String? totalAmount;
  String? status;
}

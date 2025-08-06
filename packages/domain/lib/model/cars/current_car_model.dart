class CurrentCarModel {
  CurrentCarModel({
    this.id,
    this.photo,
    this.clientProfileImage,
    this.clientFirstName,
    this.clientLastName,
    this.clientPhoneNumber,
    this.startDate,
    this.endDate,
    this.status,
    this.make,
    this.model,
  });

  num? id;
  String? photo;
  String? make;
  String? model;
  String? clientProfileImage;
  String? clientFirstName;
  String? clientLastName;
  String? clientPhoneNumber;
  String? startDate;
  String? endDate;
  String? status;
}

class UserInformationModel {
  UserInformationModel({
    this.firstName,
    this.lastName,
    this.middleName,
    this.photo,
    this.phoneNumber,
    this.passportPinfl,
    this.driverLicense,
  });

  String? firstName;
  String? lastName;
  String? middleName;
  String? photo;
  String? phoneNumber;
  String? passportPinfl;
  DriverLicense? driverLicense;
}

class DriverLicense {
  DriverLicense({
    this.text,
    this.photo,
  });

  List<String>? text;
  String? photo;
}

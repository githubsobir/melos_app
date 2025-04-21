import 'package:domain/model/profile/user_information_model.dart';

class UserInformationResponse {
  UserInformationResponse({
    this.firstName,
    this.lastName,
    this.middleName,
    this.photo,
    this.phoneNumber,
    this.passportPinfl,
    this.driverLicense,
  });

  UserInformationResponse.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    photo = json['photo'];
    phoneNumber = json['phone_number'];
    passportPinfl = json['passport_pinfl'];
    driverLicense = json['driver_license'] != null
        ? DriverLicenseResponse.fromJson(json['driver_license'])
        : null;
  }

  String? firstName;
  String? lastName;
  String? middleName;
  String? photo;
  String? phoneNumber;
  String? passportPinfl;
  DriverLicenseResponse? driverLicense;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['middle_name'] = middleName;
    map['photo'] = photo;
    map['phone_number'] = phoneNumber;
    map['passport_pinfl'] = passportPinfl;
    if (driverLicense != null) {
      map['driver_license'] = driverLicense?.toJson();
    }
    return map;
  }
}

class DriverLicenseResponse {
  DriverLicenseResponse({
    this.text,
    this.photo,
  });

  DriverLicenseResponse.fromJson(dynamic json) {
    text = json['text'] != null ? json['text'].cast<String>() : [];
    photo = json['photo'];
  }

  List<String>? text;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['photo'] = photo;
    return map;
  }
}

extension UserInformationMapper on UserInformationResponse {
  UserInformationModel toDomainModel() {
    return UserInformationModel(
      driverLicense: DriverLicense(
        text: driverLicense?.text,
        photo: driverLicense?.photo,
      ),
      firstName: firstName,
      lastName: lastName,
      middleName: middleName,
      photo: photo,
      phoneNumber: phoneNumber,
      passportPinfl: passportPinfl,
    );
  }
}

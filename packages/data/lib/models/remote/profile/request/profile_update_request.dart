class ProfileUpdateRequest {
  ProfileUpdateRequest({
    this.middleName,
    this.phoneNumber,
    this.passportPinfl,
    this.driverLicense,
    this.firstName,
    this.lastName,
  });

  ProfileUpdateRequest.fromJson(dynamic json) {
    middleName = json['middle_name'];
    phoneNumber = json['phone_number'];
    passportPinfl = json['passport_pinfl'];
    driverLicense = json['driver_license'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  String? middleName;
  String? phoneNumber;
  String? passportPinfl;
  String? driverLicense;
  String? firstName;
  String? lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['middle_name'] = middleName;
    map['phone_number'] = phoneNumber;
    map['passport_pinfl'] = passportPinfl;
    map['driver_license'] = driverLicense;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    return map;
  }
}

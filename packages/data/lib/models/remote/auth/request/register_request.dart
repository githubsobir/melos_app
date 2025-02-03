class RegisterRequest {
  RegisterRequest({
    this.lastName,
    this.firstName,
    this.middleName,
    this.phoneNumber,
    this.passportPinfl,
    this.driverLicense,
    this.password,
    this.confirmPassword,
  });

  RegisterRequest.fromJson(dynamic json) {
    lastName = json['last_name'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    phoneNumber = json['phone_number'];
    passportPinfl = json['passport_pinfl'];
    driverLicense = json['driver_license'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
  }

  String? lastName;
  String? firstName;
  String? middleName;
  String? phoneNumber;
  String? passportPinfl;
  String? driverLicense;
  String? password;
  String? confirmPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['last_name'] = lastName;
    map['first_name'] = firstName;
    map['middle_name'] = middleName;
    map['phone_number'] = phoneNumber;
    map['passport_pinfl'] = passportPinfl;
    map['driver_license'] = driverLicense;
    map['password'] = password;
    map['confirm_password'] = confirmPassword;
    return map;
  }
}

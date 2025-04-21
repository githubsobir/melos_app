class ProfileUpdateRequest {
  ProfileUpdateRequest({
    this.middleName,
    this.phoneNumber,
    this.passportPinfl,
    this.firstName,
    this.lastName,
  });

  ProfileUpdateRequest.fromJson(dynamic json) {
    middleName = json['middle_name'];
    phoneNumber = json['phone_number'];
    passportPinfl = json['passport_pinfl'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  String? middleName;
  String? phoneNumber;
  String? passportPinfl;
  String? firstName;
  String? lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['middle_name'] = middleName;
    map['phone_number'] = phoneNumber;
    map['passport_pinfl'] = passportPinfl;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    return map;
  }
}

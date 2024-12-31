class LoginRequest {
  LoginRequest({
      this.phoneNumber, 
      this.password,});

  LoginRequest.fromJson(dynamic json) {
    phoneNumber = json['phone_number'];
    password = json['password'];
  }
  String? phoneNumber;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_number'] = phoneNumber;
    map['password'] = password;
    return map;
  }

}
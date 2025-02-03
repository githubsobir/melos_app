class ForgotPasswordRequest {
  ForgotPasswordRequest({
    this.phoneNumber,
    this.newPassword,
    this.confirmPassword,
  });

  ForgotPasswordRequest.fromJson(dynamic json) {
    phoneNumber = json['phone_number'];
    newPassword = json['new_password'];
    confirmPassword = json['confirm_password'];
  }

  String? phoneNumber;
  String? newPassword;
  String? confirmPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_number'] = phoneNumber;
    map['new_password'] = newPassword;
    map['confirm_password'] = confirmPassword;
    return map;
  }
}

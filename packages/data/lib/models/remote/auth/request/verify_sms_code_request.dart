class VerifySmsCodeRequest {
  VerifySmsCodeRequest({
    this.phoneNumber,
    this.smsCode,
  });

  VerifySmsCodeRequest.fromJson(dynamic json) {
    phoneNumber = json['phone_number'];
    smsCode = json['sms_code'];
  }

  String? phoneNumber;
  String? smsCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_number'] = phoneNumber;
    map['sms_code'] = smsCode;
    return map;
  }
}

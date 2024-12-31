class SendSmsRequest {
  SendSmsRequest({
    this.phoneNumber,
  });

  SendSmsRequest.fromJson(dynamic json) {
    phoneNumber = json['phone_number'];
  }

  String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_number'] = phoneNumber;
    return map;
  }
}

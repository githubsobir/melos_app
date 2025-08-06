class FcmRegisterRegisterRequest {
  FcmRegisterRegisterRequest({
    this.token,
    this.platform,
  });

  FcmRegisterRegisterRequest.fromJson(dynamic json) {
    token = json['token'];
    platform = json['platform'];
  }

  String? token;
  String? platform;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['platform'] = platform;
    return map;
  }
}

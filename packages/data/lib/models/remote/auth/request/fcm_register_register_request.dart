class FcmRegisterRegisterRequest {
  FcmRegisterRegisterRequest({
    this.token,
    this.platform,
    this.user,
  });

  FcmRegisterRegisterRequest.fromJson(dynamic json) {
    token = json['token'];
    platform = json['platform'];
    user = json['user'];
  }

  String? token;
  String? platform;
  String? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['platform'] = platform;
    map['user'] = user;
    return map;
  }
}

class LoginResponse {
  LoginResponse({
    this.message,
    this.access,
    this.refresh,
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    access = json['access'];
    refresh = json['refresh'];
  }

  String? message;
  String? access;
  String? refresh;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['access'] = access;
    map['refresh'] = refresh;
    return map;
  }
}

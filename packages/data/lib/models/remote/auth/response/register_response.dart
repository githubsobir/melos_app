class RegisterResponse {
  RegisterResponse({
    this.message,
    this.token,
  });

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }

  String? message;
  Token? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (token != null) {
      map['token'] = token?.toJson();
    }
    return map;
  }
}

class Token {
  Token({
    this.access,
    this.refresh,
  });

  Token.fromJson(dynamic json) {
    access = json['access'];
    refresh = json['refresh'];
  }

  String? access;
  String? refresh;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access'] = access;
    map['refresh'] = refresh;
    return map;
  }
}

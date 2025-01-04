class LogoutRequest {
  LogoutRequest({
    this.refresh,
  });

  LogoutRequest.fromJson(dynamic json) {
    refresh = json['refresh'];
  }

  String? refresh;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh'] = refresh;
    return map;
  }
}

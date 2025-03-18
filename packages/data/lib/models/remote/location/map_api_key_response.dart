class MapApiKeyResponse {
  MapApiKeyResponse({
    this.key,
  });

  MapApiKeyResponse.fromJson(dynamic json) {
    key = json['key'];
  }

  String? key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    return map;
  }
}

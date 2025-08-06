import 'package:domain/model/cars/check_date_model.dart';

class CheckDateReponse {
  CheckDateReponse({
    this.isAvailable,
    this.message,
  });

  CheckDateReponse.fromJson(dynamic json) {
    isAvailable = json['is_available'];
    message = json['message'];
  }

  bool? isAvailable;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_available'] = isAvailable;
    map['message'] = message;
    return map;
  }
}

extension CheckDateMapper on CheckDateReponse {
  CheckDateModel toDomainModel() {
    return CheckDateModel(isAvailable: isAvailable, message: message);
  }
}

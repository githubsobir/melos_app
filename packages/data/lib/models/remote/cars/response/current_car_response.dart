import 'package:domain/model/cars/current_car_model.dart';

class CurrentCarResponse {
  CurrentCarResponse({
    this.id,
    this.photo,
    this.clientProfileImage,
    this.clientFirstName,
    this.clientLastName,
    this.clientPhoneNumber,
    this.startDate,
    this.endDate,
    this.status,
    this.make,
    this.model,
  });

  CurrentCarResponse.fromJson(dynamic json) {
    id = json['id'];
    photo = json['photo'];
    make = json['make'];
    model = json['model'];
    clientProfileImage = json['client_profile_image'];
    clientFirstName = json['client_first_name'];
    clientLastName = json['client_last_name'];
    clientPhoneNumber = json['client_phone_number'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
  }

  num? id;
  String? photo;
  String? make;
  String? model;
  String? clientProfileImage;
  String? clientFirstName;
  String? clientLastName;
  String? clientPhoneNumber;
  String? startDate;
  String? endDate;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['make'] = make;
    map['model'] = model;
    map['photo'] = photo;
    map['client_profile_image'] = clientProfileImage;
    map['client_first_name'] = clientFirstName;
    map['client_last_name'] = clientLastName;
    map['client_phone_number'] = clientPhoneNumber;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['status'] = status;
    return map;
  }

  static List<CurrentCarResponse> listFromJson(dynamic json) {
    return (json as List).map((i) => CurrentCarResponse.fromJson(i)).toList();
  }
}

extension CurrentCarMapper on CurrentCarResponse {
  CurrentCarModel toDomainModel() {
    return CurrentCarModel(
      id: id,
      photo: photo,
      startDate: startDate,
      endDate: endDate,
      status: status,
      clientFirstName: clientFirstName,
      clientLastName: clientLastName,
      clientPhoneNumber: clientPhoneNumber,
      clientProfileImage: clientProfileImage,
      make: make,
      model: model,
    );
  }
}

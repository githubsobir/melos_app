import 'package:domain/model/main/notification_model.dart';

class NotificationResponse {
  NotificationResponse({
    this.id,
    this.title,
    this.body,
    this.isRead,
    this.image,
  });

  NotificationResponse.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    isRead = json['is_read'];
    image = json['image'];
  }

  num? id;
  String? title;
  String? body;
  String? image;
  bool? isRead;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    map['is_read'] = isRead;
    map['image'] = image;
    return map;
  }

  static List<NotificationResponse> listFromJson(dynamic json) {
    return (json as List).map((i) => NotificationResponse.fromJson(i)).toList();
  }
}

extension NotificationMapper on NotificationResponse {
  NotificationModel toDomainModel() {
    return NotificationModel(
      id: id,
      title: title,
      body: body,
      isRead: isRead,
      image: image,
    );
  }
}

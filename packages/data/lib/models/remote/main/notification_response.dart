import 'package:domain/model/main/notification_model.dart';

class NotificationResponse {
  NotificationResponse({
    this.id,
    this.title,
    this.body,
    this.isRead,
  });

  NotificationResponse.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    isRead = json['is_read'];
  }

  num? id;
  String? title;
  String? body;
  bool? isRead;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    map['is_read'] = isRead;
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
    );
  }
}

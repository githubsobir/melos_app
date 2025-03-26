import 'package:domain/model/main/notification_model.dart';

class NotificationResponse {
  NotificationResponse({
    this.title,
    this.body,
    this.isRead,
  });

  NotificationResponse.fromJson(dynamic json) {
    title = json['title'];
    body = json['body'];
    isRead = json['is_read'];
  }

  String? title;
  String? body;
  bool? isRead;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
      title: title,
      body: body,
      isRead: isRead,
    );
  }
}

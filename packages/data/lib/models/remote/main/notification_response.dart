import 'package:domain/model/main/notification_model.dart';

class NotificationResponse {
  NotificationResponse({
    this.title,
    this.content,
    this.isRead,
  });

  NotificationResponse.fromJson(dynamic json) {
    title = json['title'];
    content = json['content'];
    isRead = json['is_read'];
  }

  String? title;
  String? content;
  bool? isRead;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['content'] = content;
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
      content: content,
      isRead: isRead,
    );
  }
}

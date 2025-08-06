import 'package:domain/model/main/notification_view_model.dart';

class NotificationViewResponse {
  final int? id;
  final String? title;
  final String? body;
  final String? text;
  final String? imageUrl;
  final String? sentAt;
  final bool? isRead;
  final String? readAt;

  const NotificationViewResponse({
    this.id,
    this.title,
    this.body,
    this.text,
    this.imageUrl,
    this.sentAt,
    this.isRead,
    this.readAt,
  });

  factory NotificationViewResponse.fromJson(Map<String, dynamic> json) {
    return NotificationViewResponse(
      id: json["id"] as int?,
      title: json["title"] as String?,
      body: json["body"] as String?,
      text: json["text"] as String?,
      imageUrl: json["image_url"] as String?,
      sentAt: json["sent_at"] as String?,
      isRead: json["is_read"] as bool?,
      readAt: json["read_at"] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "text": text,
    "image_url": imageUrl,
    "sent_at": sentAt,
    "is_read": isRead,
    "read_at": readAt,
  };

  @override
  String toString() {
    return 'NotificationViewResponse(id: $id, title: $title, body: $body, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificationViewResponse &&
        other.id == id &&
        other.title == title &&
        other.body == body &&
        other.text == text &&
        other.imageUrl == imageUrl &&
        other.sentAt == sentAt &&
        other.isRead == isRead &&
        other.readAt == readAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    title.hashCode ^
    body.hashCode ^
    text.hashCode ^
    imageUrl.hashCode ^
    sentAt.hashCode ^
    isRead.hashCode ^
    readAt.hashCode;
  }
}

extension NotificationMapper on NotificationViewResponse {
  NotificationViewModel toDomainModel() {
    return NotificationViewModel(
      id: id,
      title: title ?? '',
      body: body ?? '',
      text: text ?? '',
      imageUrl: imageUrl,
      setAt: sentAt,
      isRead: isRead ?? false,
      readAt: readAt,
    );
  }
}
class NotificationModel {
  NotificationModel({
    this.id,
    this.title,
    this.body,
    this.isRead,
    this.image,
  });

  num? id;
  String? title;
  String? body;
  String? image;
  bool? isRead;
}

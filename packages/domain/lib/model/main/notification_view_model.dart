class NotificationViewModel {
  NotificationViewModel({
    this.id,
    this.title,
    this.body,
    this.text,
    this.imageUrl,
    this.setAt,
    this.isRead,
    this.readAt,
  });

  int? id;
  String? title;
  String? body;
  String? text;
  String? imageUrl;
  String? setAt;
  bool? isRead;
  String? readAt;
}
// {
// "id": 101,
// "title": "Новая функция!",
// "body": "Мы добавили новые возможности в приложение.",
// "text": "Подробности доступны в разделе 'Обновления'.",
// "image_url": "https://example.com/update.png",
// "sent_at": "2025-07-08T12:00:00Z",
// "is_read": true,
// "read_at": "2025-07-09T09:15:00Z"
// }

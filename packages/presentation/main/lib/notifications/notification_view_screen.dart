import 'dart:developer';

import 'package:common/l10n/build_context_extension.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/model/main/notification_view_model.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:main/booking/item_car_image.dart';
import 'package:main/notifications/notification_view_cubit.dart';

class NotificationDetailModal extends StatefulWidget {
  final String notificationId;

  const NotificationDetailModal({
    super.key,
    required this.notificationId,
  });

  @override
  State<NotificationDetailModal> createState() =>
      _NotificationDetailModalState();
}

class _NotificationDetailModalState extends State<NotificationDetailModal> {
  @override
  Widget build(BuildContext context) {
    final cubit = NotificationDetailCubit(inject())
      ..loadNotification(widget.notificationId);
    return BlocBuilder<NotificationDetailCubit, NotificationDetailState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: SingleChildScrollView(
              child: Card(
                elevation: 0,
                margin: const EdgeInsets.all(0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                child: _buildContent(context, state),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, NotificationDetailState state) {
    if (state is NotificationDetailLoading) {
      return const Padding(
        padding: EdgeInsets.all(40),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state is NotificationDetailError) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Xatolik',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              state.message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context
                    .read<NotificationDetailCubit>()
                    .loadNotification(widget.notificationId);
              },
              child: const Text('Qayta urinish'),
            ),
          ],
        ),
      );
    }

    if (state is NotificationDetailLoaded) {
      return _buildNotificationContent(context, state.notification);
    }

    return const SizedBox.shrink();
  }

  DateTime? parseIsoString(String? isoString) {
    if (isoString == null || isoString.isEmpty) return null;

    try {
      return DateTime.parse(isoString);
    } catch (e) {
      print('Date parse error: $e');
      return null;
    }
  }

  Widget _buildNotificationContent(
      BuildContext context, NotificationViewModel notification) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 16,
        bottom: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
              AutoLocalizedDateFormatter.formatRelative(
                  notification.setAt.toString(), context),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
          textAlign: TextAlign.end,
          ),
          if (notification.imageUrl?.isNotEmpty == true) ...[
            const SizedBox(height: 16),
            ItemCarImage(
                height: 220,
                imagePath: "${notification.imageUrl}"),
          ],
          // Title
          Text(
            notification.title ?? 'Bildirishnoma',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),

          // Image



          const SizedBox(height: 16),

          // Body/Text content
          Text(
            notification.body.toString(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            notification.text.toString(),
            style: Theme.of(context).textTheme.labelMedium,
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// notification_modal_helper.dart - Modal ochish uchun helper method
class NotificationModalHelper {
  static void showNotificationModal({
    required BuildContext context,
    required int notificationId,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      builder: (BuildContext modalContext) {
        return NotificationDetailModal(
          notificationId: notificationId.toString(),
        );
      },
    );
  }
}

// Ishlatish misoli - notification_list_item.dart
class NotificationListItem extends StatelessWidget {
  final NotificationViewModel notification;

  const NotificationListItem({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(notification.title ?? ''),
      subtitle: Text(notification.body ?? ''),
      trailing: notification.isRead == true
          ? null
          : Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
      onTap: () {
        // Modal ochish
        NotificationModalHelper.showNotificationModal(
          context: context,
          notificationId: notification.id ?? 0,
        );
      },
    );
  }
}

class AutoLocalizedDateFormatter {
  // Avtomatik til aniqlash va formatlash
  static String formatPopular(String? isoString, [BuildContext? context]) {
    if (isoString == null || isoString.isEmpty) return '';

    try {
      final dateTime = DateTime.parse(isoString);
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final messageDay = DateTime(dateTime.year, dateTime.month, dateTime.day);
      final yesterday = today.subtract(const Duration(days: 1));

      // Avtomatik til aniqlash
      final isRussian = context?.languageCode.toString() == 'ru';

      if (messageDay == today) {
        // Bugun - faqat vaqt (har ikki tilda bir xil)
        return DateFormat('HH:mm').format(dateTime);
      } else if (messageDay == yesterday) {
        // Kecha
        return isRussian ? 'Вчера' : 'Kecha';
      } else if (dateTime.year == now.year) {
        // Bu yil ichida - kun.oy
        return DateFormat('dd.MM').format(dateTime);
      } else {
        // Boshqa yillarda - to'liq sana
        return DateFormat('dd.MM.yyyy').format(dateTime);
      }
    } catch (e) {
      return '';
    }
  }

  // Relative time formatting
  static String formatRelative(String? isoString, [BuildContext? context]) {


    if (isoString == null || isoString.isEmpty) return '';

    try {
      final dateTime = DateTime.parse(isoString);
      final now = DateTime.now();
      final difference = now.difference(dateTime);
      // log(context!.translations.notifications.toString());
      log("notifications");
      log(context!.languageCode.toString());
      // Avtomatik til aniqlash
      final isRussian = context!.languageCode== "ru";
      // final isRussian = context!.translations.notifications == "Уведомления";

      if (difference.inSeconds < 60) {
        return isRussian ? 'сейчас' : 'hozir';
      } else if (difference.inMinutes < 60) {
        final minutes = difference.inMinutes;
        return isRussian ? '${minutes} м' : '${minutes} minut';
      } else if (difference.inHours < 24) {
        final hours = difference.inHours;
        return isRussian ? '${hours}ч' : '${hours}s';
      } else if (difference.inDays < 7) {
        final days = difference.inDays;
        return isRussian ? _getRussianDayForm(days) : _getUzbekDayForm(days);
      } else if (difference.inDays < 30) {
        final weeks = (difference.inDays / 7).floor();
        return isRussian
            ? _getRussianWeekForm(weeks)
            : _getUzbekWeekForm(weeks);
      } else if (difference.inDays < 365) {
        final months = (difference.inDays / 30).floor();
        return isRussian
            ? _getRussianMonthForm(months)
            : _getUzbekMonthForm(months);
      } else {
        final years = (difference.inDays / 365).floor();
        return isRussian
            ? _getRussianYearForm(years)
            : _getUzbekYearForm(years);
      }
    } catch (e) {
      log(e.toString());
      return '';
    }
  }

  // Rus tilida grammatik formalar
  static String _getRussianDayForm(int days) {
    if (days == 1) return '1 день назад';
    if (days >= 2 && days <= 4) return '$days дня назад';
    return '$days дней назад';
  }

  static String _getRussianWeekForm(int weeks) {
    if (weeks == 1) return '1 неделю назад';
    if (weeks >= 2 && weeks <= 4) return '$weeks недели назад';
    return '$weeks недель назад';
  }

  static String _getRussianMonthForm(int months) {
    if (months == 1) return '1 месяц назад';
    if (months >= 2 && months <= 4) return '$months месяца назад';
    return '$months месяцев назад';
  }

  static String _getRussianYearForm(int years) {
    if (years == 1) return '1 год назад';
    if (years >= 2 && years <= 4) return '$years года назад';
    return '$years лет назад';
  }

  // O'zbek tilida formalar
  static String _getUzbekDayForm(int days) {
    return '$days kun oldin';
  }

  static String _getUzbekWeekForm(int weeks) {
    return '$weeks hafta oldin';
  }

  static String _getUzbekMonthForm(int months) {
    return '$months oy oldin';
  }

  static String _getUzbekYearForm(int years) {
    return '$years yil oldin';
  }

  // Til tekshirish utility methodlar
  static bool isRussian([BuildContext? context]) {
    return context?.languageCode == 'ru';
  }

  static bool isUzbek([BuildContext? context]) {
    return context?.languageCode == 'uz';
  }

  static String getCurrentLanguage([BuildContext? context]) {
    return context?.languageCode ?? 'uz';
  }
}

// Extension methods - avtomatik ishlatish uchun
extension AutoLocalizedDateFormat on String? {
  String get autoPopular => AutoLocalizedDateFormatter.formatPopular(this);

  String get autoRelative => AutoLocalizedDateFormatter.formatRelative(this);

  // Context bilan
  String autoPopularWith(BuildContext context) =>
      AutoLocalizedDateFormatter.formatPopular(this, context);

  String autoRelativeWith(BuildContext context) =>
      AutoLocalizedDateFormatter.formatRelative(this, context);
}

// Test va Demo

// Widget da ishlatish misoli
class NotificationItem extends StatelessWidget {
  final String title;
  final String body;
  final String sentAt;
  final bool isRead;

  const NotificationItem({
    Key? key,
    required this.title,
    required this.body,
    required this.sentAt,
    this.isRead = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(body),
            SizedBox(height: 4),
            Text(
              sentAt.autoRelativeWith(context), // Avtomatik localized
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        trailing: isRead
            ? Icon(Icons.check_circle, color: Colors.green, size: 16)
            : Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
      ),
    );
  }
}

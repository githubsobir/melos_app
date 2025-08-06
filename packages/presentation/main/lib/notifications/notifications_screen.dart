import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:dependency/dependencies/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main/notifications/notification_cubit.dart';
import 'package:main/notifications/notification_view_screen.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final cubit = NotificationCubit(inject())..getNotifications();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translations.notifications),
      ),
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      body: BlocProvider(

        create: (context) =>cubit,
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationsListState) {
            return ListView.builder(
              itemCount: state.notifications.length,
              padding:
              const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {

                    cubit.readNotification(index);
                    _showNotification(
                      context: context,
                      id: (state.notifications[index].id ?? 0).toString(),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            state.notifications[index].isRead == true
                                ? PathImages.readNotification
                                : PathImages.unreadNotification,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 16,
                              top: 2,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  state.notifications[index].title ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  state.notifications[index].body ?? "",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                  Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is LoaderState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      )
    );
  }

  void _showNotification({required BuildContext context, required String id}) {
    /// cubit.readNotification(state.notifications[index].id ?? 0);

    showModalBottomSheet(
      context: context,
      // backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      builder: (BuildContext bc) {
        return Container(
            margin: const EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height * 0.65,
            child: NotificationDetailModal(notificationId: id));
      },
    );
  }
}

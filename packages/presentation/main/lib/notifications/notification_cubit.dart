import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:domain/model/main/notification_model.dart';
import 'package:domain/usecase/main_usecase.dart';
import 'package:equatable/equatable.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._mainUseCase) : super(NotificationInitial());
  final MainUseCase _mainUseCase;
  List<NotificationModel> listNotification = [];

  Future<void> getNotifications() async {
    emit(LoaderState());

    try {
      var response = await _mainUseCase.getNotifications();
      if (response.success) {
        listNotification.clear();
        listNotification = response.body!;
        emit(NotificationsListState(listNotification));
      } else {
        emit(const NotificationsListState([]));
        // emit(
        //   NotificationsListState(
        //     [
        //       NotificationModel(
        //         title: "Notification title",
        //         body: "Notification body text here",
        //         image: "/backend/media/car_photos/db/cars_image/photo216.jpg",
        //         id: 1233,
        //         isRead: false,
        //       ),
        //       NotificationModel(
        //         title: "Notification title 1",
        //         body: "Notification body text here",
        //         image: "/backend/media/car_photos/db/cars_image/photo193.jpg",
        //         id: 12333,
        //         isRead: false,
        //       ),
        //       NotificationModel(
        //         title: "Notification title 2",
        //         body:
        //             "Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here v Notification body text here Notification body text here Notification body text here Notification body text hereNotification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here v Notification body text here Notification body text here Notification body text here Notification body text hereNotification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here v Notification body text here Notification body text here Notification body text here Notification body text hereNotification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here v Notification body text here Notification body text here Notification body text here Notification body text hereNotification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here v Notification body text here Notification body text here Notification body text here Notification body text hereNotification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here v Notification body text here Notification body text here Notification body text here Notification body text hereNotification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here Notification body text here v Notification body text here Notification body text here Notification body text here Notification body text hereNotification body text here ",
        //         image: "/backend/media/car_photos/db/cars_image/photo80.jpg",
        //         id: 132223,
        //         isRead: false,
        //       ),
        //     ],
        //   ),
        // );
      }
    } catch (e) {
      emit(const NotificationsListState([]));
    }
  }

  readNotification(int index) {
    final updatedList = [...listNotification];
    for (int i = 0; i < updatedList.length; i++) {
      if (index == i) {
        updatedList[index] = NotificationModel(
            title: updatedList[index].title,
            body: updatedList[index].body,
            id: updatedList[index].id,
            isRead: true);
        listNotification[index] = NotificationModel(
            title: updatedList[index].title,
            body: updatedList[index].body,
            id: updatedList[index].id,
            isRead: true);
      } else {
        updatedList[i] = NotificationModel(
            title: updatedList[i].title,
            body: updatedList[i].body,
            id: updatedList[i].id,
            isRead: updatedList[i].isRead);
        listNotification[i] = NotificationModel(
            title: updatedList[i].title,
            body: updatedList[i].body,
            id: updatedList[i].id,
            isRead: updatedList[i].isRead);
      }
    }

    emit(NotificationsListState(updatedList));
  }
}

sealed class NotificationState extends Equatable {
  const NotificationState();
}

final class NotificationInitial extends NotificationState {
  @override
  List<Object> get props => [];
}

final class LoaderState extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotificationsListState extends NotificationState {
  final List<NotificationModel> notifications;

  const NotificationsListState(this.notifications);

  @override
  List<Object> get props => [notifications];
}

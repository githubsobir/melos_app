import 'package:bloc/bloc.dart';
import 'package:domain/model/main/notification_model.dart';
import 'package:domain/usecase/main_usecase.dart';
import 'package:equatable/equatable.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._mainUseCase) : super(NotificationInitial());
  final MainUseCase _mainUseCase;

  Future<void> getNotifications() async {
    emit(LoaderState());
    var response = await _mainUseCase.getNotifications();
    if (response.success) {
      var info = response.body;
      if (info != null) {
        emit(NotificationsListState(info));
      }
    }
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

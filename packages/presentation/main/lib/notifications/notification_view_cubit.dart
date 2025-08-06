// notification_detail_cubit.dart
import 'package:domain/model/main/notification_view_model.dart';
import 'package:domain/usecase/main_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



// Cubit
class NotificationDetailCubit extends Cubit<NotificationDetailState> {
  final MainUseCase _mainUseCase;

  NotificationDetailCubit(this._mainUseCase)
      : super(NotificationDetailInitial());

  Future<void> loadNotification(String id) async {
    emit(NotificationDetailLoading());

    try {
      final response = await _mainUseCase.readNotification(id: int.parse(id));

      final notification = response.body; // extension method ishlatiladi
      emit(NotificationDetailLoaded(notification!));
        } catch (e) {
      emit(NotificationDetailError('Xatolik yuz berdi: ${e.toString()}'));
    }
  }

  void reset() {
    emit(NotificationDetailInitial());
  }
}
// States
abstract class NotificationDetailState extends Equatable {
  const NotificationDetailState();

  @override
  List<Object?> get props => [];
}

class NotificationDetailInitial extends NotificationDetailState {}

class NotificationDetailLoading extends NotificationDetailState {}

class NotificationDetailLoaded extends NotificationDetailState {
  final NotificationViewModel notification;

  const NotificationDetailLoaded(this.notification);

  @override
  List<Object?> get props => [notification];
}

class NotificationDetailError extends NotificationDetailState {
  final String message;

  const NotificationDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
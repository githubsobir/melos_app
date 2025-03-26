import 'package:domain/model/main/notification_model.dart';
import 'package:domain/utils/base_result.dart';

abstract class MainRepository {
  Future<BaseResult<List<NotificationModel>>> getNotifications();

  Future<BaseResult<bool>> readNotification({required num id});
}

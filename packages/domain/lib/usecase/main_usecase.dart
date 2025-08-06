import 'package:domain/model/main/notification_model.dart';
import 'package:domain/model/main/notification_view_model.dart';
import 'package:domain/repository/main_repository.dart';
import 'package:domain/utils/base_result.dart';

class MainUseCase {
  final MainRepository _mainRepository;

  MainUseCase(this._mainRepository);

  Future<BaseResult<List<NotificationModel>>> getNotifications() {
    return _mainRepository.getNotifications();
  }

  Future<BaseResult<NotificationViewModel>> readNotification(
      {required num id}) async {
    return await _mainRepository.readNotification(id: id);
  }
}

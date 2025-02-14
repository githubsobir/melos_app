import 'package:data/models/remote/main/notification_response.dart';
import 'package:data/service/main_service.dart';
import 'package:data/service/profile_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/main/notification_model.dart';
import 'package:domain/repository/main_repository.dart';
import 'package:domain/utils/base_result.dart';

class MainRepositoryImpl extends MainRepository {
  final MainService _mainService;

  MainRepositoryImpl(this._mainService);

  @override
  Future<BaseResult<List<NotificationModel>>> getNotifications() async {
    try {
      var response = await _mainService.getNotifications();
      return BaseResult(
        success: true,
        body: NotificationResponse.listFromJson(response.data)
            .map(
              (e) => e.toDomainModel(),
            )
            .toList(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }
}

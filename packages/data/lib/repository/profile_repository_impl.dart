import 'package:data/models/remote/profile/request/profile_update_request.dart';
import 'package:data/models/remote/profile/response/balance_response.dart';
import 'package:data/models/remote/profile/response/check_response.dart';
import 'package:data/models/remote/profile/response/user_information_response.dart';
import 'package:data/service/profile_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/profile/balance_model.dart';
import 'package:domain/model/profile/check_model.dart';
import 'package:domain/model/profile/user_information_model.dart';
import 'package:domain/repository/profile_repository.dart';
import 'package:domain/utils/base_result.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileService _profileService;

  ProfileRepositoryImpl(this._profileService);

  @override
  Future<BaseResult<bool>> updateUser({
    required String firstName,
    required String lastName,
    required String middleName,
    required String passportPinfl,
    required String phoneNumber,
  }) async {
    try {
      var response = await _profileService.updateUser(
          request: ProfileUpdateRequest(
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        passportPinfl: passportPinfl,
      ));
      return BaseResult(
        success: true,
        body: true,
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<UserInformationModel>> userInformation() async {
    try {
      var response = await _profileService.userInformation();
      return BaseResult(
        success: true,
        body: UserInformationResponse.fromJson(response.data).toDomainModel(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<bool>> uploadImage(String path) async {
    try {
      var response = await _profileService.uploadImage(path);
      return BaseResult(
        success: true,
        body: true,
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<int>> unreadNotification() async {
    try {
      var response = await _profileService.unreadNotification();
      return BaseResult(
        success: true,
        body: response.data['unread_count'],
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<CheckModel>> checkInvoice() async {
    try {
      var response = await _profileService.checkInvoice();
      return BaseResult(
        success: true,
        body: CheckResponse.fromJson(response.data).toDomainModel(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<BalanceModel>> balance() async {
    try {
      var response = await _profileService.balance();
      return BaseResult(
        success: true,
        body: BalanceResponse.fromJson(response.data).toDomainModel(),
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error_note']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }

  @override
  Future<BaseResult<bool>> withdraw({required String amount}) async {
    try {
      var response = await _profileService.withdraw(
        amount: amount,
      );
      return BaseResult(
        success: true,
        body: true,
      );
    } on DioException catch (error) {
      return BaseResult(
          success: false, exceptionBody: error.response?.data['error']);
    } catch (exception) {
      return BaseResult(success: false, exceptionBody: exception);
    }
  }
}

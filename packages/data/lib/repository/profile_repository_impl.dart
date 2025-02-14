import 'package:data/models/remote/profile/request/profile_update_request.dart';
import 'package:data/models/remote/profile/response/user_information_response.dart';
import 'package:data/service/profile_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/profile/user_information_model.dart';
import 'package:domain/repository/profile_repository.dart';
import 'package:domain/utils/base_result.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileService _profileService;

  ProfileRepositoryImpl(this._profileService);

  @override
  Future<BaseResult<bool>> updateUser(
      {required String firstName,
      required String lastName,
      required String middleName,
      required String passportPinfl,
      required String driverLicense,
      required String phoneNumber}) async {
    try {
      var response = await _profileService.updateUser(
          request: ProfileUpdateRequest(
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        passportPinfl: passportPinfl,
        driverLicense: driverLicense,
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
}

import 'package:domain/model/profile/user_information_model.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/profile_repository.dart';
import 'package:domain/utils/base_result.dart';

class ProfileUseCase {
  final ProfileRepository _profileRepository;
  final AuthRepository _authRepository;

  ProfileUseCase(this._profileRepository, this._authRepository);

  Future<BaseResult<bool>> updateUser(
      {required String firstName,
      required String lastName,
      required String middleName,
      required String passportPinfl,
      required String driverLicense,
      required String phoneNumber}) {
    return _profileRepository.updateUser(
      firstName: firstName,
      lastName: lastName,
      middleName: middleName,
      passportPinfl: passportPinfl,
      driverLicense: driverLicense,
      phoneNumber: phoneNumber,
    );
  }

  Future<BaseResult<UserInformationModel>> userInformation() {
    return _profileRepository.userInformation();
  }

  Future<BaseResult<bool>> uploadImage(String path) {
    return _profileRepository.uploadImage(path);
  }

  Future<bool> hasUser() {
    return _authRepository.hasUser();
  }
}

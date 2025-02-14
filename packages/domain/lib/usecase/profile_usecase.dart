import 'package:domain/model/cars/car_model.dart';
import 'package:domain/repository/profile_repository.dart';
import 'package:domain/utils/base_result.dart';

class ProfileUseCase {
  final ProfileRepository _profileRepository;
  ProfileUseCase(this._profileRepository);

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
}

import 'package:domain/utils/base_result.dart';

abstract class ProfileRepository {
  Future<BaseResult<bool>> updateUser(
      {required String firstName,
      required String lastName,
      required String middleName,
      required String passportPinfl,
      required String driverLicense,
      required String phoneNumber});
}

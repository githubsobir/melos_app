import 'package:domain/model/profile/user_information_model.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/payment_repository.dart';
import 'package:domain/repository/profile_repository.dart';
import 'package:domain/utils/base_result.dart';

class PaymentUseCase {
  final PaymentRepository _paymentRepository;

  PaymentUseCase(this._paymentRepository);

  // Future<BaseResult<bool>> updateUser(
  //     {required String firstName,
  //     required String lastName,
  //     required String middleName,
  //     required String passportPinfl,
  //     required String driverLicense,
  //     required String phoneNumber}) {
  //   return _paymentRepository.updateUser(
  //     firstName: firstName,
  //     lastName: lastName,
  //     middleName: middleName,
  //     passportPinfl: passportPinfl,
  //     driverLicense: driverLicense,
  //     phoneNumber: phoneNumber,
  //   );
  // }

}

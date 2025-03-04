import 'package:data/network/net_base.dart';

class PaymentService {
  final NetBase _netBase;

  PaymentService(this._netBase);

// Future<Response> updateUser({required ProfileUpdateRequest request}) async {
//   var response = await _netBase.dio.put(
//     'user/update/',
//     data: request.toJson(),
//   );
//   return response;
// }
}

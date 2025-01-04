// import 'package:chuck_interceptor/chuck.dart';
import 'package:chuck_interceptor/chuck.dart';
import 'package:data/utils/custom_functions.dart';
import 'package:data/utils/my_shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class NetBase {
  late Dio dio;
  GlobalKey<NavigatorState> navigatorKey;

  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: "$BASE_URL/api/",
    sendTimeout: const Duration(seconds: 60000),
    receiveTimeout: const Duration(seconds: 60000),
    connectTimeout: const Duration(seconds: 60000),
    contentType: 'application/json',
  );

  NetBase(this.navigatorKey) {
    dio = Dio(_baseOptions);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        //checkConnection();
        final token = await MySharedPref.instance.getAccessToken();
        if (token.isNotEmpty) {
          // options.headers['Authorization'] = 'Bearer $token';
        }
        myPrint("⬇⬇⬇ onRequest ⬇⬇⬇");
        myPrint(options.method);
        myPrint(options.uri);
        myPrint(options.headers.toString());
        myPrint(options.data);
        myPrint("⬆⬆⬆ onRequest ⬆⬆⬆");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        myPrint("⬇⬇⬇ onResponse ⬇⬇⬇");
        myPrint(response);
        myPrint("⬆⬆⬆ onResponse ⬆⬆⬆");
        return handler.next(response);
      },
      onError: (e, handler) async {
        if (e.response?.statusCode == 401) {
          // refreshToken();
        }
        myPrint("⬇⬇⬇ onError ⬇⬇⬇");
        myPrint(e.error);
        myPrint(e.response);
        myPrint("⬆⬆⬆ onError ⬆⬆⬆");
        return handler.next(e);
      },
    ));
    if (!kReleaseMode) {
      var alice = Chuck(
          navigatorKey: navigatorKey,
          showNotification: true,
          showInspectorOnShake: true);
      dio.interceptors.add(alice.getDioInterceptor());
    }
  }

// Future<BaseResult<bool>> refreshToken() async {
//   try {
//     // var response = await dio.post('user/login/refresh',
//     //     data: {"refresh": await MySharedPref.instance.getRefreshToken()});
//     // if (response.statusCode == 200) {
//     //   await MySharedPref.instance.saveToken(response.data['access'] ?? "");
//     //   return BaseResponse(success: true, body: true);
//     // } else {
//     //   return BaseResponse(success: false, message: "Something went wrong");
//     // }
//     return BaseResult(success: false, exceptionBody: "Something went wrong");
//   } catch (e) {
//     return BaseResult(success: false, exceptionBody: e);
//   }
// }
}

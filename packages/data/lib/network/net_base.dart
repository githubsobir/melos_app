import 'package:chuck_interceptor/chuck.dart';
import 'package:data/network/auth_interceptor.dart';
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
    dio.interceptors.add(AuthInterceptor(
      dio: dio,
      refreshTokenUrl: "users/token/refresh/",
      onLogout: () async {
        await MySharedPref.instance.clearAllData();
        navigatorKey.currentState?.popUntil((route) => route.isFirst);
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          "/login",
          (route) => false,
        );
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
}

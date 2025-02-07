// import 'package:chuck_interceptor/chuck.dart';
import 'dart:async';

import 'package:chuck_interceptor/chuck.dart';
import 'package:data/utils/custom_functions.dart';
import 'package:data/utils/my_shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:domain/utils/base_result.dart';
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

  var isRefreshing = Completer();
  bool isIdle = true;

  NetBase(this.navigatorKey) {
    dio = Dio(_baseOptions);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        //checkConnection();
        final token = await MySharedPref.instance.getAccessToken();
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        final language = await MySharedPref.instance.getLanguageCode();
        options.headers['Accept-Language'] = language;
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
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          if(error.requestOptions.path.contains("refresh-token")){
            await MySharedPref.instance.clearAllData();
            // closeAllScreenAndOpenMain(PhoneNumberScreen());
          }else{
            if (isIdle) {
              isIdle = false;
              var value = await refreshToken();
              if (value.success) {
                isRefreshing.complete();
                isIdle = true;
                var response = await dio.request(
                  error.requestOptions.path,
                  data: error.requestOptions.data,
                  queryParameters: error.requestOptions.queryParameters,
                  options: Options(
                    method: error.requestOptions.method,
                    headers: error.requestOptions.headers,
                  ),
                );
                return handler.resolve(response);
              }
            } else {
              await isRefreshing.future;
              var response = await dio.request(
                error.requestOptions.path,
                data: error.requestOptions.data,
                queryParameters: error.requestOptions.queryParameters,
                options: Options(
                  method: error.requestOptions.method,
                  headers: error.requestOptions.headers,
                ),
              );
              return handler.resolve(response);
            }
          }
        }
        myPrint("⬇⬇⬇ onError ⬇⬇⬇");
        myPrint(error.error);
        myPrint(error.response);
        myPrint("⬆⬆⬆ onError ⬆⬆⬆");
        return handler.next(error);
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

  Future<BaseResult<bool>> refreshToken() async {
    try {
      var response = await dio.post('users/token/refresh/',
          data: {"refresh": await MySharedPref.instance.getRefreshToken()});
      if (response.statusCode == 200) {
        await MySharedPref.instance
            .setAccessToken(response.data['access'] ?? "");
        await MySharedPref.instance
            .setRefreshToken(response.data['refresh'] ?? "");
        return BaseResult(success: true, body: true);
      } else {
        return BaseResult(
            success: false, exceptionBody: "Something went wrong");
      }
    } catch (e) {
      return BaseResult(success: false, exceptionBody: e);
    }
  }
}

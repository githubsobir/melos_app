import 'dart:async';

import 'package:data/utils/custom_functions.dart';
import 'package:data/utils/my_shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final String refreshTokenUrl;
  final VoidCallback onLogout;
  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;

  AuthInterceptor({
    required this.dio,
    required this.refreshTokenUrl,
    required this.onLogout,
  });

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
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
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    myPrint("⬇⬇⬇ onResponse ⬇⬇⬇");
    myPrint(response);
    myPrint("⬆⬆⬆ onResponse ⬆⬆⬆");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && err.requestOptions.path != refreshTokenUrl) {

      // // Agar refresh token ham tugagan bo'lsa, logout qilamiz
      // if (err.requestOptions.path == refreshTokenUrl) {
      //   onLogout(); // Foydalanuvchini tizimdan chiqarish
      //   return handler.reject(err);
      // }


      // Agar refresh token allaqachon ishlayotgan bo‘lsa, kutib turamiz
      if (_isRefreshing) {
        await _refreshCompleter?.future;
        return handler.resolve(await _retryRequest(err.requestOptions));
      }

      _isRefreshing = true;
      _refreshCompleter = Completer<void>();

      try {
        await _refreshToken();
        _refreshCompleter?.complete();
      } catch (e) {
        _refreshCompleter?.completeError(e);
        return handler.reject(err);
      } finally {
        _isRefreshing = false;
      }

      // Yangilangan token bilan so‘rovni qayta yuboramiz
      return handler.resolve(await _retryRequest(err.requestOptions));
    }

    // Agar refresh token olish so‘rovi 401 bo‘lsa, logout qilamiz
    if (err.response?.statusCode == 401 && err.requestOptions.path == refreshTokenUrl) {
      onLogout();
      return handler.reject(err);
    }

    myPrint("⬇⬇⬇ onError ⬇⬇⬇");
    myPrint(err.error);
    myPrint(err.response);
    myPrint("⬆⬆⬆ onError ⬆⬆⬆");
    super.onError(err, handler);
  }

  /// Yangi token bilan so‘rovni qayta yuborish
  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        // Eski headerlarni saqlab qolamiz
        'Authorization':
            'Bearer ${await MySharedPref.instance.getAccessToken()}',
        // Yangilangan token qo‘shamiz
      },
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  /// Refresh tokenni yangilash
  Future<void> _refreshToken() async {
    try {
      final response = await dio.post(
        refreshTokenUrl,
        data: {
          "refresh": await MySharedPref.instance.getRefreshToken(),
        },
      );
      if (response.statusCode == 200) {
        await MySharedPref.instance.setAccessToken(response.data["access"]);
        await MySharedPref.instance.setRefreshToken(response.data["refresh"]);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: refreshTokenUrl),
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}

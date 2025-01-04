import 'package:data/utils/custom_functions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  MySharedPref._();

  static SharedPreferences? _sharedPreferences;
  static final MySharedPref instance = MySharedPref._();

  Future<SharedPreferences> _getInstance() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
      return _sharedPreferences ?? await SharedPreferences.getInstance();
    } else {
      return _sharedPreferences ?? await SharedPreferences.getInstance();
    }
  }

  Future<bool> clearAllData() async {
    SharedPreferences prefs = await _getInstance();
    return prefs.clear();
  }

  Future<bool> setAccessToken(String token) async {
    SharedPreferences prefs = await _getInstance();
    myPrint("setAccessToken: $token");
    return prefs.setString('ACCESS_TOKEN', token);
  }

  Future<String> getAccessToken() async {
    SharedPreferences prefs = await _getInstance();
    String token = prefs.getString('ACCESS_TOKEN') ?? "";
    return token;
  }

  Future<bool> setRefreshToken(String token) async {
    SharedPreferences prefs = await _getInstance();
    myPrint("setRefreshToken: $token");
    return prefs.setString('REFRESH_TOKEN', token);
  }

  Future<String> getRefreshToken() async {
    SharedPreferences prefs = await _getInstance();
    String token = prefs.getString('REFRESH_TOKEN') ?? "";
    return token;
  }

  Future<bool> setLanguageCode(String languageCode) async {
    SharedPreferences prefs = await _getInstance();
    myPrint("setLanguageCode: $languageCode");
    return prefs.setString('LANGUAGE_CODE', languageCode);
  }

  Future<String> getLanguageCode() async {
    SharedPreferences prefs = await _getInstance();
    String name = prefs.getString('LANGUAGE_CODE') ?? "ru";
    return name;
  }

  Future<bool> setThemeMode(ThemeMode mode) async {
    SharedPreferences prefs = await _getInstance();
    myPrint("setThemeMode: $mode");
    return prefs.setString('THEME_MODE', mode.name);
  }

  Future<String> getThemeMode() async {
    SharedPreferences prefs = await _getInstance();
    String name = prefs.getString('THEME_MODE') ?? ThemeMode.system.name;
    return name;
  }
}

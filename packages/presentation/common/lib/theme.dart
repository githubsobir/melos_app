// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Original theme can be found here:
// https://github.com/flutter/gallery/blob/master/lib/themes/gallery_theme_data.dart

// Let's not care about deprecated theme variables right now...
// ignore_for_file: deprecated_member_use

import 'package:common/font_family.dart';
import 'package:flutter/material.dart';

const _lightFillColor = Colors.black;
const _darkFillColor = Colors.white;

final Color _lightFocusColor = Colors.black.withOpacity(0.12);
final Color _darkFocusColor = Colors.white.withOpacity(0.12);

final ThemeData lightThemeData = _themeDataLight(
  _lightColorScheme,
  _lightFocusColor,
);
final ThemeData darkThemeData = _themeDataDark(
  _darkColorScheme,
  _darkFocusColor,
);

ThemeData _themeDataLight(ColorScheme colorScheme, Color focusColor) {
  return ThemeData(
    colorScheme: colorScheme,
    textTheme: _textTheme,
    primaryColor: Colors.greenAccent,
    dividerTheme: const DividerThemeData(
      color: Color(0xFFD9D9D9),
    ),
    hintColor: const Color(0xFF596780),
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.background,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Color(0xFF192960)),
      centerTitle: true,
      titleTextStyle: _textTheme.titleSmall?.copyWith(
        color: const Color(0xFF050E2B),
        fontWeight: FontWeight.w700,
      ),
    ),
    iconTheme: IconThemeData(color: colorScheme.onPrimary),
    canvasColor: colorScheme.background,
    scaffoldBackgroundColor: colorScheme.background,
    highlightColor: Colors.transparent,
    focusColor: focusColor,
  );
}

ThemeData _themeDataDark(ColorScheme colorScheme, Color focusColor) {
  return ThemeData(
    colorScheme: colorScheme,
    textTheme: _textTheme,
    primaryColor: Colors.greenAccent,
    dividerTheme: const DividerThemeData(
      color: Color(0xFFD9D9D9),
    ),
    hintColor: const Color(0xFF596780),
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.background,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      titleTextStyle: _textTheme.titleSmall,
    ),
    iconTheme: IconThemeData(color: colorScheme.onPrimary),
    canvasColor: colorScheme.background,
    scaffoldBackgroundColor: colorScheme.background,
    highlightColor: Colors.transparent,
    focusColor: focusColor,
  );
}

const ColorScheme _lightColorScheme = ColorScheme(
  primary: Color(0xFF3563E9),
  secondary: Color(0xFF90A3BF),
  surface: Color(0xFFFFFFFF),
  error: _lightFillColor,
  onError: _lightFillColor,
  onPrimary: _lightFillColor,
  onSecondary: Color(0xFF322942),
  onSurface: Color(0xFF241E30),
  brightness: Brightness.light,
);

const ColorScheme _darkColorScheme = ColorScheme(
  primary: Color(0xFF3563E9),
  secondary: Color(0xFF90A3BF),
  surface: Color(0xFF1F1929),
  error: _darkFillColor,
  onError: _darkFillColor,
  onPrimary: _darkFillColor,
  onSecondary: _darkFillColor,
  onSurface: _darkFillColor,
  brightness: Brightness.dark,
);

const _regular = FontWeight.w400;
const _medium = FontWeight.w500;
const _semiBold = FontWeight.w600;
const _bold = FontWeight.w700;

TextTheme _textTheme = TextTheme(
  bodySmall: TextStyle(
      fontFamily: "packages/common/${FontFamily.REGULAR.name}", fontSize: 14),
  bodyMedium: TextStyle(
      fontFamily: "packages/common/${FontFamily.MEDIUM.name}", fontSize: 16),
  bodyLarge: TextStyle(
      fontFamily: "packages/common/${FontFamily.BOLD.name}", fontSize: 18),
//   ----------------------- //
  labelSmall: TextStyle(
      fontFamily: "packages/common/${FontFamily.REGULAR.name}", fontSize: 14),
  labelMedium: TextStyle(
      fontFamily: "packages/common/${FontFamily.MEDIUM.name}", fontSize: 12),
  labelLarge: TextStyle(
      fontFamily: "packages/common/${FontFamily.REGULAR.name}", fontSize: 14),
  //   ----------------------- //
  titleSmall: TextStyle(
      fontFamily: "packages/common/${FontFamily.BOLD.name}", fontSize: 20),
  titleMedium: TextStyle(
      fontFamily: "packages/common/${FontFamily.BOLD.name}", fontSize: 24,fontWeight: _bold),
  headlineMedium: TextStyle(
      fontFamily: "packages/common/${FontFamily.MEDIUM.name}", fontSize: 20,fontWeight: _regular),
);

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

final ThemeData lightThemeData = _themeData(
  _lightColorScheme,
  _lightFocusColor,
);
final ThemeData darkThemeData = _themeData(
  _darkColorScheme,
  _darkFocusColor,
);

ThemeData _themeData(ColorScheme colorScheme, Color focusColor) {
  return ThemeData(
    colorScheme: colorScheme,
    textTheme: _textTheme,
    // Matches manifest.json colors and background color.
    primaryColor: Colors.greenAccent,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.background,
      elevation: 0,
      iconTheme: IconThemeData(color: colorScheme.primary),
    ),
    iconTheme: IconThemeData(color: colorScheme.onPrimary),
    canvasColor: colorScheme.background,
    scaffoldBackgroundColor: colorScheme.background,
    highlightColor: Colors.transparent,
    focusColor: focusColor,
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color.alphaBlend(
        _lightFillColor.withOpacity(0.8),
        _darkFillColor,
      ),
      // contentTextStyle: _textTheme.subtitle1!.apply(color: _darkFillColor),
    ),
  );
}

const ColorScheme _lightColorScheme = ColorScheme(
  primary: Color(0xFF3563E9),
  secondary: Colors.green,
  surface: Color(0xFFFAFBFB),
  error: _lightFillColor,
  onError: _lightFillColor,
  onPrimary: _lightFillColor,
  onSecondary: Color(0xFF322942),
  onSurface: Color(0xFF241E30),
  brightness: Brightness.light,
);

const ColorScheme _darkColorScheme = ColorScheme(
  primary: Colors.red,
  secondary: Colors.blue,
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
    fontFamily: "packages/common/${FontFamily.REGULAR.name}",
  ),
  bodyMedium: TextStyle(
    fontFamily: "packages/common/${FontFamily.MEDIUM.name}",
  ),
  bodyLarge: TextStyle(
    fontFamily: "packages/common/${FontFamily.BOLD.name}",
  ),
);

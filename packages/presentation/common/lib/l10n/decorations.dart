import 'package:flutter/cupertino.dart';

class Decorations {
  static basicDecoration({
    Color? background,
    Color? borderColor,
    double? radius,
  }) {
    return BoxDecoration(
      borderRadius: radius != null ? BorderRadius.circular(radius) : null,
      color: background,
      border: borderColor != null ? Border.all(color: borderColor) : null,
    );
  }
}

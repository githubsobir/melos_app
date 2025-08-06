import 'package:flutter/foundation.dart';

void myPrint(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}
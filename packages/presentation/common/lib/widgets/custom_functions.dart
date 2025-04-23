import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String? message) {
  Fluttertoast.showToast(
    msg: message ?? "",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey.shade200,
    textColor: Colors.black,
    fontSize: 16.0,
  );
}

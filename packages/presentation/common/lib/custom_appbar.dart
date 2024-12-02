import 'package:flutter/material.dart';

class CustomAppbar extends AppBar {
  CustomAppbar({super.key})
      : super(
            elevation: 0.0,
            leading: IconButton(
                onPressed: () {
                  // SystemNavigator.pop();

                },
                icon: Icon(Icons.arrow_back_ios)));
}

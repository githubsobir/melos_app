import 'package:flutter/material.dart';

class CustomAppbar extends AppBar {
  final BuildContext context;

  CustomAppbar({super.key, required this.context})
      : super(
            elevation: 0.0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)));
}

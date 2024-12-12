import 'package:flutter/material.dart';

class CustomAppbar extends AppBar {
  final Widget? title;
  final BuildContext context;

  CustomAppbar({super.key, required this.context, this.title})
      : super(
            elevation: 0.0,
            title: title,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)));
}

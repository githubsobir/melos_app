import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key, required this.id});

  final num id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translations.my_cars),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(84.0),
        child: Image.asset(PathImages.carImage),
      )),
    );
  }
}

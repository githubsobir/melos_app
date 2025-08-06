import 'package:flutter/material.dart';

class BaseLoaderBuilder extends StatelessWidget {
 final Widget child;
  final bool hasLoading;

  const BaseLoaderBuilder({super.key, required this.child, this.hasLoading = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
          visible: hasLoading,
          child: const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}

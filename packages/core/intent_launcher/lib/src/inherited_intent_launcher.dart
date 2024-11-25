import 'package:flutter/material.dart';

import 'intent_launcher.dart';

class InheritedIntentLauncher extends InheritedWidget {
  final IntentLauncher launcher;

  const InheritedIntentLauncher({
    super.key,
    required super.child,
    required this.launcher,
  });

  static InheritedIntentLauncher of(BuildContext context) {
    final InheritedIntentLauncher? result =
        context.dependOnInheritedWidgetOfExactType<InheritedIntentLauncher>();
    assert(result != null, 'No InheritedIntentLauncher found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedIntentLauncher oldWidget) {
    return false;
  }
}

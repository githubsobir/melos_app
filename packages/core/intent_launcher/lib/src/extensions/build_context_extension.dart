import 'package:flutter/material.dart';

import '../intent_launcher.dart';
import '../intents/navigation_intent.dart';

extension BuildContextExtension on BuildContext {
  Future<T?> openScreen<T>(NavigationIntent intent) {
    return IntentLauncher.openScreen(this, intent);
  }

  closeActiveScreen<T extends Object?>([T? result]) {
    Navigator.pop(this, result);
  }
}

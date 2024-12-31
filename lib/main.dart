import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'dependencies.dart';

void main() {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  configureDependencies(const DependencyConfigurationContext());
  runApp(const MyApp());
}

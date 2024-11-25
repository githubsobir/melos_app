import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'dependencies.dart';

void main() {
  configureDependencies(const DependencyConfigurationContext());
  runApp(const MyApp());
}

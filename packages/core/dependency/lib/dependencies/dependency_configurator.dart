import 'package:dependency/dependencies.dart';
import 'package:get_it/get_it.dart';

abstract class DependencyConfigurator {
  void configureDependencies(
    DependencyConfigurationContext context,
    GetIt getIt,
  );
}
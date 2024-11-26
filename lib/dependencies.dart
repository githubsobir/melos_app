import 'package:data/di/app_state_dependency_configurator.dart';
import 'package:dependency/dependencies.dart';
import 'package:get_it/get_it.dart';

final configurators = [
  AppStateDependencyConfigurator()
  // NetBaseDependencyConfigurator(),
  // AuthDependencyConfigurator(),
  // MainDependencyConfigurator(),
  // UserDependencyConfigurator(),
  // HistoryDependencyConfigurator(),
  // TemplateDependencyConfigurator(),
  // SettingsDependencyConfigurator()
];

void configureDependencies(DependencyConfigurationContext context) {
  for (var configurator in configurators) {
    configurator.configureDependencies(context, GetIt.instance);
  }
}

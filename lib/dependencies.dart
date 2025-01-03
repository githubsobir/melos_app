import 'package:data/di/app_state_dependency_configurator.dart';
import 'package:data/di/auth_dependency_configurator.dart';
import 'package:data/di/global_state_configurator.dart';
import 'package:data/di/net_base_dependency_configurator.dart';
import 'package:data/di/shared_pref_dependency_configurator.dart';
import 'package:dependency/dependencies.dart';
import 'package:get_it/get_it.dart';

final configurators = [
  GlobalStateDependencyConfigurator(),
  SharedPrefDependencyConfigurator(),
  AppStateDependencyConfigurator(),
  NetBaseDependencyConfigurator(),
  AuthDependencyConfigurator(),
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

import 'package:data/utils/app_state_notifier_impl.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/utils/app_state_notifier.dart';
import 'package:get_it/get_it.dart';

class AppStateDependencyConfigurator implements DependencyConfigurator {
  @override
  void configureDependencies(
    DependencyConfigurationContext context,
    GetIt getIt,
  ) {
    getIt.registerSingleton<AppStateNotifier>(AppStateNotifierImpl());
  }
}

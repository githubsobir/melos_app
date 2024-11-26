import 'package:data/utils/my_shared_pref.dart';
import 'package:dependency/dependencies.dart';
import 'package:get_it/get_it.dart';

class SharedPrefDependencyConfigurator implements DependencyConfigurator {
  @override
  void configureDependencies(
    DependencyConfigurationContext context,
    GetIt getIt,
  ) {
    getIt.registerSingleton<MySharedPref>(MySharedPref.instance);
  }
}

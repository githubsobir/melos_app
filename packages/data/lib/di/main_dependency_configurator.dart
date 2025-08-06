import 'package:data/network/net_base.dart';
import 'package:data/repository/main_repository_impl.dart';
import 'package:data/service/main_service.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/repository/main_repository.dart';
import 'package:domain/usecase/main_usecase.dart';
import 'package:get_it/get_it.dart';

class MainDependencyConfigurator implements DependencyConfigurator {
  @override
  void configureDependencies(
    DependencyConfigurationContext context,
    GetIt getIt,
  ) {
    getIt.registerSingleton<MainService>(MainService(getIt.get<NetBase>()));

    getIt.registerSingleton<MainRepository>(
        MainRepositoryImpl(getIt.get<MainService>()));

    getIt.registerSingleton<MainUseCase>(
        MainUseCase(getIt.get<MainRepository>()));
  }
}

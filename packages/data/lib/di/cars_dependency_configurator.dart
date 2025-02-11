import 'package:data/network/net_base.dart';
import 'package:data/repository/cars_repository_impl.dart';
import 'package:data/service/cars_service.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/cars_repository.dart';
import 'package:domain/usecase/cars_usecase.dart';
import 'package:get_it/get_it.dart';

class CarsDependencyConfigurator implements DependencyConfigurator {
  @override
  void configureDependencies(
    DependencyConfigurationContext context,
    GetIt getIt,
  ) {
    getIt.registerSingleton<CarsService>(CarsService(getIt.get<NetBase>()));

    getIt.registerSingleton<CarsRepository>(
        CarsRepositoryImpl(getIt.get<CarsService>()));

    getIt.registerSingleton<CarsUseCase>(
        CarsUseCase(getIt.get<CarsRepository>(), getIt.get<AuthRepository>()));
  }
}

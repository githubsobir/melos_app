import 'package:data/network/net_base.dart';
import 'package:data/repository/auth_repository_impl.dart';
import 'package:data/service/auth_service.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/usecase/auth_usecase.dart';
import 'package:get_it/get_it.dart';

class AuthDependencyConfigurator implements DependencyConfigurator {
  @override
  void configureDependencies(
    DependencyConfigurationContext context,
    GetIt getIt,
  ) {
    getIt.registerSingleton<AuthService>(AuthService(getIt.get<NetBase>()));

    getIt.registerSingleton<AuthRepository>(
        AuthRepositoryImpl(getIt.get<AuthService>()));

    getIt.registerSingleton<AuthUseCase>(
        AuthUseCase(getIt.get<AuthRepository>()));
  }
}

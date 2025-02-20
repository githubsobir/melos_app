import 'package:data/network/net_base.dart';
import 'package:data/repository/profile_repository_impl.dart';
import 'package:data/service/profile_service.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/profile_repository.dart';
import 'package:domain/usecase/profile_usecase.dart';
import 'package:get_it/get_it.dart';

class ProfileDependencyConfigurator implements DependencyConfigurator {
  @override
  void configureDependencies(
    DependencyConfigurationContext context,
    GetIt getIt,
  ) {
    getIt.registerSingleton<ProfileService>(
        ProfileService(getIt.get<NetBase>()));

    getIt.registerSingleton<ProfileRepository>(
        ProfileRepositoryImpl(getIt.get<ProfileService>()));

    getIt.registerSingleton<ProfileUseCase>(ProfileUseCase(
        getIt.get<ProfileRepository>(), getIt.get<AuthRepository>()));
  }
}

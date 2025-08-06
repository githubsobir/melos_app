import 'package:data/network/net_base.dart';
import 'package:data/repository/contracts_repository_impl.dart';
import 'package:data/service/contracts_service.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/repository/contracts_repository.dart';
import 'package:domain/usecase/contracts_usecase.dart';
import 'package:get_it/get_it.dart';

class ContractsDependencyConfigurator implements DependencyConfigurator {
  @override
  void configureDependencies(
    DependencyConfigurationContext context,
    GetIt getIt,
  ) {
    getIt.registerSingleton<ContractsService>(
        ContractsService(getIt.get<NetBase>()));

    getIt.registerSingleton<ContractsRepository>(
        ContractsRepositoryImpl(getIt.get<ContractsService>()));

    getIt.registerSingleton<ContractsUseCase>(
        ContractsUseCase(getIt.get<ContractsRepository>()));
  }
}

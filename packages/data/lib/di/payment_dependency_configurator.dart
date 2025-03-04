import 'package:data/network/net_base.dart';
import 'package:data/repository/main_repository_impl.dart';
import 'package:data/repository/payment_repository_impl.dart';
import 'package:data/service/main_service.dart';
import 'package:data/service/payment_service.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/repository/main_repository.dart';
import 'package:domain/repository/payment_repository.dart';
import 'package:domain/usecase/main_usecase.dart';
import 'package:domain/usecase/payment_usecase.dart';
import 'package:get_it/get_it.dart';

class PaymentDependencyConfigurator implements DependencyConfigurator {
  @override
  void configureDependencies(
    DependencyConfigurationContext context,
    GetIt getIt,
  ) {
    getIt.registerSingleton<PaymentService>(PaymentService(getIt.get<NetBase>()));

    getIt.registerSingleton<PaymentRepository>(
        PaymentRepositoryImpl(getIt.get<PaymentService>()));

    getIt.registerSingleton<PaymentUseCase>(
        PaymentUseCase(getIt.get<PaymentRepository>()));
  }
}

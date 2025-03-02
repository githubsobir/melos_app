import 'package:data/network/net_base.dart';
import 'package:data/repository/booking_repository_impl.dart';
import 'package:data/service/booking_service.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/repository/booking_repository.dart';
import 'package:domain/usecase/booking_usecase.dart';
import 'package:get_it/get_it.dart';

class BookingDependencyConfigurator implements DependencyConfigurator {
  @override
  void configureDependencies(
    DependencyConfigurationContext context,
    GetIt getIt,
  ) {
    getIt.registerSingleton<BookingService>(
        BookingService(getIt.get<NetBase>()));

    getIt.registerSingleton<BookingRepository>(
        BookingRepositoryImpl(getIt.get<BookingService>()));

    getIt.registerSingleton<BookingUseCase>(
        BookingUseCase(getIt.get<BookingRepository>()));
  }
}

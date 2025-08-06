import 'package:data/network/net_base.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class NetBaseDependencyConfigurator implements DependencyConfigurator {
  @override
  void configureDependencies(
    DependencyConfigurationContext context,
    GetIt getIt,
  ) {
    getIt.registerSingleton<NetBase>(
        NetBase(getIt.get<GlobalKey<NavigatorState>>()));
  }
}

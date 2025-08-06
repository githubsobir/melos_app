import 'package:get_it/get_it.dart';

GetIt get getIt => GetIt.instance;

T inject<T extends Object>({
  String? instanceName,
  dynamic param1,
  dynamic param2,
}) {
  return getIt.get(
    instanceName: instanceName,
    param1: param1,
    param2: param2,
  );
}

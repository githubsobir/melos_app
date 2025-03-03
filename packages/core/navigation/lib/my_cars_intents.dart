import 'package:intent_launcher/intent_launcher.dart';

class MyCarsIntent implements NavigationIntent {
  static String path = "/my_cars";
}
class MyCarLocationIntent implements NavigationIntent {
  static String path = "/my_car_location";
}

class CreateCarInfoIntent implements NavigationIntent {
  static String path = "/create_car_info";
}

class CarInfoDetailIntent implements NavigationIntent {
  static String path = "/car_info";
  num carId;

  CarInfoDetailIntent({required this.carId});
}

import 'package:intent_launcher/intent_launcher.dart';

class MyCarsIntent implements NavigationIntent {
  static String path = "/my_cars";
}

class MyCarLocationIntent implements NavigationIntent {
  static String path = "/my_car_location";
  final double latitude;
  final double longitude;

  MyCarLocationIntent({
    required this.latitude,
    required this.longitude,
  });
}

class CreateCarInfoIntent implements NavigationIntent {
  static String path = "/create_car_info";
}

class LocationsScreenIntent implements NavigationIntent {
  static String path = "/LocationsScreenIntent";
}

class SelectLocationScreenIntent implements NavigationIntent {
  static String path = "/SelectLocationScreenIntent";
}

class CarInfoDetailIntent implements NavigationIntent {
  static String path = "/car_info";
  num carId;

  CarInfoDetailIntent({required this.carId});
}

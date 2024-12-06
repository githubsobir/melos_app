import 'package:intent_launcher/intent_launcher.dart';

class MainIntent implements NavigationIntent {
  static String path = "/main";
}

class BookingIntent implements NavigationIntent {
  static String path = "/booking";
}

class BookingHistoryIntent implements NavigationIntent {
  static String path = "/booking_history";
}

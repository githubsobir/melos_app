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

class HelpIntent implements NavigationIntent {
  static String path = "/help";
}

class MyCarsIntent implements NavigationIntent {
  static String path = "/my_cars";
}
class PaymentDetailsIntent implements NavigationIntent {
  static String path = "/payment_details";
}

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

class PaymentDetailsIntent implements NavigationIntent {
  static String path = "/payment_details";
  final num carId;
  final String startDateTme;
  final String endDateTme;

  PaymentDetailsIntent({
    required this.carId,
    required this.startDateTme,
    required this.endDateTme,
  });
}

class NotificationsScreenIntent implements NavigationIntent {
  static String path = "/notifications";
}

class ReceivingTheCarScreenIntent implements NavigationIntent {
  static String path = "/receiving_the_car";
  num bookingId;

  ReceivingTheCarScreenIntent({required this.bookingId});
}

class ConfirmBookingScreenIntent implements NavigationIntent {
  static String path = "/ConfirmBookingScreenIntent";
  num contractId;

  ConfirmBookingScreenIntent({required this.contractId});
}

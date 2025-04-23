import 'package:authentication/forgot_password/forgot_password_screen.dart';
import 'package:authentication/login/login_screen.dart';
import 'package:authentication/otp_code_screen/otp_code_screen.dart';
import 'package:authentication/password/password_screen.dart';
import 'package:authentication/register/register_screen.dart';
import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:common/navigation/profile_navigation_intents.dart';
import 'package:domain/model/profile/user_information_model.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:locations/locations/locations_screen.dart';
import 'package:locations/my_car/my_car_location_screen.dart';
import 'package:locations/select_location/select_location_screen.dart';
import 'package:main/booking/booking_screen.dart';
import 'package:main/booking_history/booking_history_screen.dart';
import 'package:main/car_info/car_info_detail_screen.dart';
import 'package:main/main/main_screen.dart';
import 'package:main/my_cars/create_car/create_car_info_screen.dart';
import 'package:main/my_cars/my_cars/lock_screen.dart';
import 'package:main/my_cars/my_cars/my_cars_screen.dart';
import 'package:main/notifications/notifications_screen.dart';
import 'package:main/payment_details/confirm_booking/confirm_booking_screen.dart';
import 'package:main/payment_details/payment_details_screen.dart';
import 'package:main/payment_details/receiving_the_car/receiving_the_car_screen.dart';
import 'package:navigation/main_navigation_intents.dart';
import 'package:navigation/my_cars_intents.dart';
import 'package:navigation/splash_navigation_intents.dart';
import 'package:profile/check/check_screen.dart';
import 'package:profile/edit_profile/edit_profile_screen.dart';
import 'package:profile/reports/reports_screen.dart';
import 'package:profile/withdrawing_money/withdrawing_money_screen.dart';
import 'package:splash/onboarding/onboarding_screen.dart';
import 'package:splash/splash/splash_screen.dart';

final _launcher = IntentLauncher()
// login
  ..onNavigationIntent<OnboardingIntent>((context, intent) {
    return Navigator.pushReplacementNamed(context, OnboardingIntent.path);
  })
  ..onNavigationIntent<LoginIntent>((context, intent) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    return Navigator.pushNamedAndRemoveUntil(
      context,
      LoginIntent.path,
      (route) => false,
    );
  })
  ..onNavigationIntent<LoginGoIntent>((context, intent) {
    return Navigator.pushNamed(context, LoginGoIntent.path);
  })
  ..onNavigationIntent<PasswordScreenIntent>((context, intent) {
    return Navigator.pushNamed(
      context,
      PasswordScreenIntent.path,
      arguments: intent.phoneNumber,
    );
  })
  ..onNavigationIntent<RegisterIntent>((context, intent) {
    return Navigator.pushReplacementNamed(
      context,
      RegisterIntent.path,
      arguments: intent.phoneNumber,
    );
  })
  ..onNavigationIntent<OtpCodeIntent>((context, intent) {
    return Navigator.pushNamed(
      context,
      OtpCodeIntent.path,
      arguments: {
        "phoneNumber": intent.phoneNumber,
        "isRegister": intent.isRegister,
      },
    );
  })
  ..onNavigationIntent<ForgotPasswordIntent>((context, intent) {
    return Navigator.pushNamed(
      context,
      ForgotPasswordIntent.path,
      arguments: intent.phoneNumber,
    );
  })
// main
  ..onNavigationIntent<MainIntent>((context, intent) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    return Navigator.pushNamedAndRemoveUntil(
      context,
      MainIntent.path,
      (route) => false,
    );
  })
  ..onNavigationIntent<BookingIntent>((context, intent) {
    return Navigator.pushNamed(context, BookingIntent.path);
  })
  ..onNavigationIntent<BookingHistoryIntent>((context, intent) {
    return Navigator.pushNamed(context, BookingHistoryIntent.path);
  })
  ..onNavigationIntent<NotificationsScreenIntent>((context, intent) {
    return Navigator.pushNamed(context, NotificationsScreenIntent.path);
  })
  ..onNavigationIntent<LocationsScreenIntent>((context, intent) {
    return Navigator.pushNamed(context, LocationsScreenIntent.path);
  })
  ..onNavigationIntent<LockScreenIntent>((context, intent) {
    return Navigator.pushNamed(context, LockScreenIntent.path,
        arguments: intent.id);
  })
  ..onNavigationIntent<SelectLocationScreenIntent>((context, intent) {
    return Navigator.pushNamed(context, SelectLocationScreenIntent.path);
  })
//MyCars
  ..onNavigationIntent<MyCarsIntent>((context, intent) {
    return Navigator.pushNamed(context, MyCarsIntent.path);
  })
  ..onNavigationIntent<CreateCarInfoIntent>((context, intent) {
    return Navigator.pushNamed(context, CreateCarInfoIntent.path);
  })
  ..onNavigationIntent<PaymentDetailsIntent>((context, intent) {
    return Navigator.pushNamed(context, PaymentDetailsIntent.path, arguments: {
      "carId": intent.carId,
      "startDateTme": intent.startDateTme,
      "endDateTme": intent.endDateTme,
    });
  })
  ..onNavigationIntent<ReceivingTheCarScreenIntent>((context, intent) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    return Navigator.pushNamedAndRemoveUntil(
      context,
      ReceivingTheCarScreenIntent.path,
      arguments: intent.bookingId,
      (route) => false,
    );
  })
  ..onNavigationIntent<ReceivingTheCarGoScreenIntent>((context, intent) {
    return Navigator.pushNamed(
      context,
      ReceivingTheCarGoScreenIntent.path,
      arguments: intent.bookingId,
    );
  })
  ..onNavigationIntent<ConfirmBookingScreenIntent>((context, intent) {
    return Navigator.pushNamed(
      context,
      ConfirmBookingScreenIntent.path,
      arguments: intent.contractId,
    );
  })
  ..onNavigationIntent<CarInfoDetailIntent>((context, intent) {
    return Navigator.pushNamed(context, CarInfoDetailIntent.path,
        arguments: intent.carId);
  })
  ..onNavigationIntent<MyCarLocationIntent>((context, intent) {
    return Navigator.pushNamed(context, MyCarLocationIntent.path,
        arguments: intent.id);
  })
//profile
  ..onNavigationIntent<EditProfileIntent>((context, intent) {
    return Navigator.pushNamed(context, EditProfileIntent.path,
        arguments: intent.info);
  })
  ..onNavigationIntent<CheckScreenIntent>((context, intent) {
    return Navigator.pushNamed(context, CheckScreenIntent.path);
  })
  ..onNavigationIntent<ReportsScreenIntent>((context, intent) {
    return Navigator.pushNamed(context, ReportsScreenIntent.path);
  })
  ..onNavigationIntent<WithdrawingMoneyScreenIntent>((context, intent) {
    return Navigator.pushNamed(context, WithdrawingMoneyScreenIntent.path);
  });

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  if (SplashIntent.path == settings.name) {
    return _createRoute(SplashScreen().wrapWith(_launcher));
  } else if (OnboardingIntent.path == settings.name) {
    return _createRoute(OnboardingScreen().wrapWith(_launcher));
  } else if (LoginIntent.path == settings.name) {
    return _createRoute(LoginScreen().wrapWith(_launcher));
  } else if (LoginGoIntent.path == settings.name) {
    return _createRoute(LoginScreen().wrapWith(_launcher));
  } else if (PasswordScreenIntent.path == settings.name) {
    return _createRoute(
        PasswordScreen(phoneNumber: settings.arguments as String)
            .wrapWith(_launcher));
  } else if (RegisterIntent.path == settings.name) {
    return _createRoute(RegisterScreen(
      phoneNumber: settings.arguments as String,
    ).wrapWith(_launcher));
  } else if (OtpCodeIntent.path == settings.name) {
    var map = settings.arguments as Map;
    return _createRoute(OtpCodeScreen(
      isRegister: map["isRegister"],
      phoneNumber: map["phoneNumber"],
    ).wrapWith(_launcher));
  } else if (ForgotPasswordIntent.path == settings.name) {
    return _createRoute(ForgotPasswordScreen(
      phoneNumber: settings.arguments as String,
    ).wrapWith(_launcher));
  } else if (MainIntent.path == settings.name) {
    return _createRoute(const MainScreen().wrapWith(_launcher));
  } else if (BookingIntent.path == settings.name) {
    return _createRoute(const BookingScreen().wrapWith(_launcher));
  } else if (BookingHistoryIntent.path == settings.name) {
    return _createRoute(BookingHistoryScreen().wrapWith(_launcher));
  } else if (LocationsScreenIntent.path == settings.name) {
    return _createRoute(LocationsScreen().wrapWith(_launcher));
  } else if (LockScreenIntent.path == settings.name) {
    return _createRoute(LockScreen(
      id: settings.arguments as num,
    ).wrapWith(_launcher));
  } else if (SelectLocationScreenIntent.path == settings.name) {
    return _createRoute(SelectLocationScreen().wrapWith(_launcher));
  } else if (NotificationsScreenIntent.path == settings.name) {
    return _createRoute(NotificationsScreen().wrapWith(_launcher));
  } else if (MyCarsIntent.path == settings.name) {
    return _createRoute(const MyCarsScreen().wrapWith(_launcher));
  } else if (MyCarLocationIntent.path == settings.name) {
    return _createRoute(MyCarLocationScreen(
      id: settings.arguments as num,
    ).wrapWith(_launcher));
  } else if (CarInfoDetailIntent.path == settings.name) {
    var cardId = settings.arguments as num;
    return _createRoute(CarInfoDetailScreen(
      carId: cardId,
    ).wrapWith(_launcher));
  } else if (CreateCarInfoIntent.path == settings.name) {
    return _createRoute(CreateCarInfoScreen().wrapWith(_launcher));
  } else if (PaymentDetailsIntent.path == settings.name) {
    var map = settings.arguments as Map;
    return _createRoute(PaymentDetailsScreen(
      carId: map["carId"],
      startDateTme: map["startDateTme"],
      endDateTme: map["endDateTme"],
    ).wrapWith(_launcher));
  } else if (ReceivingTheCarScreenIntent.path == settings.name) {
    var bookingId = settings.arguments as num;
    return _createRoute(ReceivingTheCarScreen(
      bookingId: bookingId,
      hasBack: false,
    ).wrapWith(_launcher));
  } else if (ReceivingTheCarGoScreenIntent.path == settings.name) {
    var bookingId = settings.arguments as num;
    return _createRoute(ReceivingTheCarScreen(
      bookingId: bookingId,
      hasBack: true,
    ).wrapWith(_launcher));
  } else if (ConfirmBookingScreenIntent.path == settings.name) {
    var bookingId = settings.arguments as num;
    return _createRoute(
        ConfirmBookingScreen(bookingId: bookingId).wrapWith(_launcher));
  } else if (EditProfileIntent.path == settings.name) {
    var info = settings.arguments as UserInformationModel;
    return _createRoute(EditProfileScreen(
      info: info,
    ).wrapWith(_launcher));
  } else if (CheckScreenIntent.path == settings.name) {
    return _createRoute(CheckScreen().wrapWith(_launcher));
  } else if (ReportsScreenIntent.path == settings.name) {
    return _createRoute(ReportsScreen().wrapWith(_launcher));
  } else if (WithdrawingMoneyScreenIntent.path == settings.name) {
    return _createRoute(WithdrawingMoneyScreen().wrapWith(_launcher));
  }
  return null;
}

Route<dynamic> _createRoute(Widget builder) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => builder,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // const begin = Offset(1.0, 0.0);
      // const end = Offset.zero;
      // const curve = Curves.ease;
      //
      // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      //
      // // return SlideTransition(
      // //   position: animation.drive(tween),
      // //   child: child,
      // // );
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

// Route<dynamic> _route(WidgetBuilder builder) {
//   return MaterialPageRoute(
//     builder: builder,
//   );
// }

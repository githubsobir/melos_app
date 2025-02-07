import 'package:authentication/forgot_password/forgot_password_screen.dart';
import 'package:authentication/login/login_screen.dart';
import 'package:authentication/otp_code_screen/otp_code_screen.dart';
import 'package:authentication/password/password_screen.dart';
import 'package:authentication/phone_number/phone_number_screen.dart';
import 'package:authentication/register/register_screen.dart';
import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:main/booking/booking_screen.dart';
import 'package:main/booking_history/booking_history_screen.dart';
import 'package:main/car_info/car_info_detail_screen.dart';
import 'package:main/help/help_screen.dart';
import 'package:main/main/main_screen.dart';
import 'package:main/my_cars/create_car/create_car_info_screen.dart';
import 'package:main/my_cars/my_cars_screen.dart';
import 'package:main/payment_details/payment_details_screen.dart';
import 'package:navigation/main_navigation_intents.dart';
import 'package:navigation/my_cars_intents.dart';
import 'package:navigation/profile_navigation_intents.dart';
import 'package:navigation/splash_navigation_intents.dart';
import 'package:profile/edit_profile/edit_profile_screen.dart';
import 'package:splash/onboarding/onboarding_screen.dart';
import 'package:splash/splash/splash_screen.dart';

final _launcher = IntentLauncher()
// login
      ..onNavigationIntent<OnboardingIntent>((context, intent) {
        return Navigator.pushReplacementNamed(context, OnboardingIntent.path);
      })
      ..onNavigationIntent<LoginIntent>((context, intent) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        return Navigator.pushReplacementNamed(context, LoginIntent.path);
      })
      ..onNavigationIntent<PasswordScreenIntent>((context, intent) {
        // Navigator.of(context).popUntil((route) => route.isFirst);
        return Navigator.pushNamed(
          context,
          PasswordScreenIntent.path,
          arguments: intent.phoneNumber,
        );
      })
      ..onNavigationIntent<RegisterIntent>((context, intent) {
        return Navigator.pushReplacementNamed(context, RegisterIntent.path);
      })
      ..onNavigationIntent<PhoneNumberIntent>((context, intent) {
        return Navigator.pushNamed(context, PhoneNumberIntent.path,
            arguments: intent.isRegister);
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
        return Navigator.pushReplacementNamed(context, MainIntent.path);
      })
      ..onNavigationIntent<BookingIntent>((context, intent) {
        return Navigator.pushNamed(context, BookingIntent.path);
      })
      ..onNavigationIntent<BookingHistoryIntent>((context, intent) {
        return Navigator.pushNamed(context, BookingHistoryIntent.path);
      })
      ..onNavigationIntent<HelpIntent>((context, intent) {
        return Navigator.pushNamed(context, HelpIntent.path);
      })
//MyCars
      ..onNavigationIntent<MyCarsIntent>((context, intent) {
        return Navigator.pushNamed(context, MyCarsIntent.path);
      })
      ..onNavigationIntent<CreateCarInfoIntent>((context, intent) {
        return Navigator.pushNamed(context, CreateCarInfoIntent.path);
      })
      ..onNavigationIntent<PaymentDetailsIntent>((context, intent) {
        return Navigator.pushNamed(context, PaymentDetailsIntent.path);
      })
      ..onNavigationIntent<CarInfoDetailIntent>((context, intent) {
        return Navigator.pushNamed(context, CarInfoDetailIntent.path,arguments: intent.carId);
      })
//profile
      ..onNavigationIntent<EditProfileIntent>((context, intent) {
        return Navigator.pushNamed(context, EditProfileIntent.path);
      })
// ..onNavigationIntent<EditUserScreenIntent>((context, intent) {
//   return Navigator.pushNamed(context, EditUserScreenIntent.path,
//       arguments: intent.id);
// })
// ..onNavigationIntent<EditTemplateIntent>((context, intent) {
//   return Navigator.pushNamed(context, EditTemplateIntent.path, arguments: {
//     "id": intent.id,
//     "language": intent.language,
//     "name": intent.name,
//     "message": intent.message,
//     "status": intent.status
//   });
// })
    ;

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  if (SplashIntent.path == settings.name) {
    return _createRoute(SplashScreen().wrapWith(_launcher));
  } else if (OnboardingIntent.path == settings.name) {
    return _createRoute(OnboardingScreen().wrapWith(_launcher));
  } else if (LoginIntent.path == settings.name) {
    return _createRoute(LoginScreen().wrapWith(_launcher));
  } else if (PasswordScreenIntent.path == settings.name) {
    return _createRoute(
        PasswordScreen(phoneNumber: settings.arguments as String)
            .wrapWith(_launcher));
  } else if (RegisterIntent.path == settings.name) {
    return _createRoute(RegisterScreen().wrapWith(_launcher));
  } else if (PhoneNumberIntent.path == settings.name) {
    var isRegister = settings.arguments as bool;
    return _createRoute(PhoneNumberScreen(
      isRegister: isRegister,
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
    return _createRoute(MainScreen().wrapWith(_launcher));
  } else if (BookingIntent.path == settings.name) {
    return _createRoute(BookingScreen().wrapWith(_launcher));
  } else if (BookingHistoryIntent.path == settings.name) {
    return _createRoute(BookingHistoryScreen().wrapWith(_launcher));
  } else if (HelpIntent.path == settings.name) {
    return _createRoute(HelpScreen().wrapWith(_launcher));
  } else if (MyCarsIntent.path == settings.name) {
    return _createRoute(MyCarsScreen().wrapWith(_launcher));
  } else if (CarInfoDetailIntent.path == settings.name) {
    var cardId = settings.arguments as num;
    return _createRoute(CarInfoDetailScreen(
      carId: cardId,
    ).wrapWith(_launcher));
  } else if (CreateCarInfoIntent.path == settings.name) {
    return _createRoute(CreateCarInfoScreen().wrapWith(_launcher));
  } else if (PaymentDetailsIntent.path == settings.name) {
    return _createRoute(PaymentDetailsScreen().wrapWith(_launcher));
  } else if (EditProfileIntent.path == settings.name) {
    return _createRoute(EditProfileScreen().wrapWith(_launcher));
  }
  // } else if (EditUserScreenIntent.path == settings.name) {
  //   var id = settings.arguments as num;
  //   return _route((_) => EditUserScreen(id: id).wrapWith(_launcher));
  // } else if (EditTemplateIntent.path == settings.name) {
  //   var map = settings.arguments as Map;
  //
  //   return _route((_) => EditTemplateScreen(
  //           id: map["id"],
  //           language: map["language"],
  //           name: map["name"],
  //           message: map["message"],
  //           status: map["status"])
  //       .wrapWith(_launcher));
  // }
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

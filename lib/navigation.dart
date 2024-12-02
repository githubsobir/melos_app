import 'package:authentication/forgot_password/forgot_password_screen.dart';
import 'package:authentication/forgot_password/phone_number_screen.dart';
import 'package:authentication/login/login_screen.dart';
import 'package:authentication/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/auth_navigation_intents.dart';
import 'package:navigation/splash_navigation_intents.dart';
import 'package:splash/onboarding/onboarding_screen.dart';
import 'package:splash/splash/splash_screen.dart';

final _launcher = IntentLauncher()
      ..onNavigationIntent<OnboardingIntent>((context, intent) {
        return Navigator.pushReplacementNamed(context, OnboardingIntent.path);
      })
      ..onNavigationIntent<LoginIntent>((context, intent) {
        return Navigator.pushReplacementNamed(context, LoginIntent.path);
      })
      ..onNavigationIntent<RegisterIntent>((context, intent) {
        return Navigator.pushReplacementNamed(context, RegisterIntent.path);
      })
      ..onNavigationIntent<PhoneNumberIntent>((context, intent) {
        return Navigator.pushNamed(context, PhoneNumberIntent.path);
      })
      ..onNavigationIntent<ForgotPasswordIntent>((context, intent) {
        return Navigator.pushNamed(context, ForgotPasswordIntent.path);
      })
// ..onNavigationIntent<MainIntent>((context, intent) {
//   return Navigator.pushReplacementNamed(context, MainIntent.path);
// })
// ..onNavigationIntent<CreateUserScreenIntent>((context, intent) {
//   return Navigator.pushNamed(context, CreateUserScreenIntent.path);
// })
// ..onNavigationIntent<EditUserScreenIntent>((context, intent) {
//   return Navigator.pushNamed(context, EditUserScreenIntent.path,
//       arguments: intent.id);
// })
// ..onNavigationIntent<CreateTemplateScreenIntent>((context, intent) {
//   return Navigator.pushNamed(context, CreateTemplateScreenIntent.path);
// })
// ..onNavigationIntent<CreateHistoryIntent>((context, intent) {
//   return Navigator.pushNamed(context, CreateHistoryIntent.path);
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
  } else if (RegisterIntent.path == settings.name) {
    return _createRoute(RegisterScreen().wrapWith(_launcher));
  } else if (PhoneNumberIntent.path == settings.name) {
    return _createRoute(PhoneNumberScreen().wrapWith(_launcher));
  } else if (ForgotPasswordIntent.path == settings.name) {
    return _createRoute(ForgotPasswordScreen().wrapWith(_launcher));
  }
  // else if (MainIntent.path == settings.name) {
  //   return _route((_) => MainScreen().wrapWith(_launcher));
  // } else if (CreateUserScreenIntent.path == settings.name) {
  //   return _route((_) => CreateUserScreen().wrapWith(_launcher));
  // } else if (EditUserScreenIntent.path == settings.name) {
  //   var id = settings.arguments as num;
  //   return _route((_) => EditUserScreen(id: id).wrapWith(_launcher));
  // } else if (CreateTemplateScreenIntent.path == settings.name) {
  //   return _route((_) => CreateTemplateScreen().wrapWith(_launcher));
  // } else if (CreateHistoryIntent.path == settings.name) {
  //   return _route((_) => CreateHistoryScreen().wrapWith(_launcher));
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

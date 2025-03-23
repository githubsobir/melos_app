import 'package:carbnb/app/app_cubit.dart';
import 'package:carbnb/navigation.dart';
import 'package:common/l10n/generated/app_localizations.dart';
import 'package:common/theme.dart';
import 'package:dependency/dependencies/injector.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.instance.getToken().then(
      (value) {
        print("fbtoken:$value");
      },
    );
    return BlocBuilder<AppCubit, AppState>(
      bloc: AppCubit(inject(), inject()),
      builder: (context, state) {
        return MaterialApp(
          title: 'CarBNB',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerateRoute,
          themeMode: state.themeMode,
          theme: lightThemeData
            ..textTheme.apply(bodyColor: const Color(0xFF050E2B)),
          darkTheme: darkThemeData,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(state.languageCode),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          navigatorKey: getIt.get<GlobalKey<NavigatorState>>(),
        );
      },
    );
  }
}

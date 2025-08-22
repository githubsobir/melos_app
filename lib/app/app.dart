import 'package:carbnb/app/app_cubit.dart';
import 'package:carbnb/navigation.dart';
import 'package:common/l10n/generated/app_localizations.dart';
import 'package:common/theme.dart';
import 'package:dependency/dependencies/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
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
            navigatorKey: getIt.get<GlobalKey<NavigatorState>>());
      },
    );
  }
}

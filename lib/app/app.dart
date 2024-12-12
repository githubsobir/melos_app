import 'package:carbnb/app/app_cubit.dart';
import 'package:carbnb/navigation.dart';
import 'package:common/l10n/localizations.dart';
import 'package:common/theme.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(inject(), inject()),
      child: BlocBuilder<AppCubit, AppState>(
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
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              AppLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}

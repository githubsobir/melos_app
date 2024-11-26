import 'package:carbnb/app/bloc/app_cubit.dart';
import 'package:common/l10n/localizations.dart';
import 'package:common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Barber',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoute,
            themeMode: state.themeMode,
            theme: lightThemeData,
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

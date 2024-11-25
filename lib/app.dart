import 'package:common/theme.dart';
import 'package:flutter/material.dart';

import 'navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barber',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      // themeMode: state.mode,
      theme: lightThemeData,
      darkTheme: darkThemeData,
    );
  }
}

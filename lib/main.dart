import 'dart:io';

import 'package:carbnb/firebase_options.dart';
import 'package:common/bloc/date_time_cubit.dart';
import 'package:common/storage/hive_service.dart';
import 'package:dependency/dependencies.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // HttpOverrides.global = MyHttpOverrides();
  configureDependencies(const DependencyConfigurationContext());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await HiveService.init();
  FirebaseMessaging.instance.requestPermission();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DateTimeCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

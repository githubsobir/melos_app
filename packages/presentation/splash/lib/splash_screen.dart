import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/splash_navigation_intents.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer( Duration(seconds: 3), () {
      context.openScreen(OnboardingIntent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text("CarB&B",style: TextStyle(
            color: Color(0xFF3563E9)
          ),),
        ),
      ),
    );
  }
}

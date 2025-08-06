import 'package:common/font_family.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/main_navigation_intents.dart';
import 'package:splash/splash/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashCubit cubit = SplashCubit(inject())..openNextScreen();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: cubit,
      listener: (context, state) {
        if (state is OnBoardingScreenState) {
          // context.openScreen(OnboardingIntent());
          context.openScreen(MainIntent());
        } else if (state is MainScreenState) {
          context.openScreen(MainIntent());
        }
      },
      child: Scaffold(
        backgroundColor:
        Theme.of(context).colorScheme.brightness == Brightness.light
            ? const Color(0xFFF6F7F9)
            : const Color(0xFF061136),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "CarBNB",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontFamily: FontFamily.BOLD.name,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

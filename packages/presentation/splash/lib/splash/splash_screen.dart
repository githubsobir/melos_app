import 'package:common/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/main_navigation_intents.dart';
import 'package:navigation/splash_navigation_intents.dart';
import 'package:splash/splash/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashCubit cubit = SplashCubit()..openNextScreen();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: cubit,
      listener: (context, state) {
        if (state is NextScreenState) {
          context.openScreen(MainIntent());
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "CarB&B",
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

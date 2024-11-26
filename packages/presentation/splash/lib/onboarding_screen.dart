import 'package:common/base_button.dart';
import 'package:common/font_family.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:dependency/dependencies/injector.dart';
import 'package:domain/utils/app_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:splash/splash_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final SplashCubit cubit = SplashCubit(getIt.get<AppStateNotifier>());

   bool isNight= false;
   bool isRussian= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Hello",
              style: Theme.of(context).textTheme.bodySmall!,
            ),
            Text(
              "Hello",
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
            Text(
              "Hello",
              style: Theme.of(context).textTheme.bodyLarge!,
            ),

            Text(
              "Grey",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontFamily.ROBOTO_BOLD.name,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BaseButton(
              title: context.translations.next,
              onPressed: () {
                print("lang: ${context.languageCode}");
              },
            ),
            BaseButton(
              title: context.translations.change,
              onPressed: () {
                cubit.setNightMode(isNight);
                isNight=!isNight;
              },
            ),
            BaseButton(
              title: context.translations.change,
              onPressed: () {
                cubit.setLanguage(isRussian?"uz":"ru");
                isRussian=!isRussian;
              },
            ),
          ],
        ),
      ),
    );
  }
}

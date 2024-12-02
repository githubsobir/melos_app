import 'package:common/base_button.dart';
import 'package:common/custom_otp.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/auth_navigation_intents.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 150,
              ),
              Text(
                "Аутентификация",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                "Пожалуйста, введите код аутентификации, отправленный на вашу электронную почту",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              CustomOtp(
                onPinEntered: (String code) {},
              ),
              const SizedBox(height: 32),
              BaseButton(
                  onPressed: () {
                    context.openScreen(CreateNewPasswordIntent());
                  },
                  title: "Отправлять"),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () {

                },
                child: Text(
                  "Не получили код?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

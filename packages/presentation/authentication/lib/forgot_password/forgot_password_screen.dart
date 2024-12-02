import 'package:authentication/forgot_password/custom_otp.dart';
import 'package:common/base_button.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/auth_navigation_intents.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text("Регистрация"),
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 150,
              ),
              Text(
                "Аутентификация",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8),
              Text(
                "Пожалуйста, введите код аутентификации, отправленный на вашу электронную почту",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 32),
              CustomOtp(
                onPinEntered: (String code) {

                },
              ),
              SizedBox(height: 32),
              BaseButton(onPressed: () {}, title: "Войти"),
              SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  context.openScreen(RegisterIntent());
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'У меня нет аккаунта ',
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'Регистрация',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      TextSpan(
                        text: '?!',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

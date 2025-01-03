import 'package:common/base_button.dart';
import 'package:common/base_text_field.dart';
import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/main_navigation_intents.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Авторизоваться"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                PathImages.carLogin,
                height: 150,
                width: 212,
              ),
              BaseTextField(
                title: "Контактный телефон",
                hint: "+998 __ ___ __ __",
                type: TextFieldType.PHONE,
              ),
              SizedBox(height: 16),
              BaseTextField(
                title: "Пароль",
                hint: "Пароль",
                type: TextFieldType.PASSWORD,
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  context.openScreen(PhoneNumberIntent());
                },
                child: Text(
                  "Забыли пароль?",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: 42),
              Row(
                children: [
                  SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: Checkbox(value: true, onChanged: (value) {})),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Запомнить меня?",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(height: 14),
              BaseButton(
                  onPressed: () {
                    context.openScreen(MainIntent());
                  },
                  title: "Войти"),
              SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  context.openScreen(PhoneNumberIntent());
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

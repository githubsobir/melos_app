import 'package:common/base_button.dart';
import 'package:common/base_text_field.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/auth_navigation_intents.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Регистрация"),
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
                title: "Фамилия",
                hint: "Фамилия",
              ),
              SizedBox(height: 4),
              BaseTextField(
                title: "Имя",
                hint: "Имя",
              ),
              SizedBox(height: 4),
              BaseTextField(
                title: "Очества",
                hint: "Очества",
              ),
              SizedBox(height: 4),
              BaseTextField(
                title: "Контактный телефон",
                hint: "+998 __ ___ __ __",
              ),
              SizedBox(height: 4),
              BaseTextField(
                title: "ПИНФЛ",
                hint: "ПИНФЛ",
              ),
              SizedBox(height: 4),
              BaseTextField(
                title: "Вод Прав",
                hint: "Вод Прав",
              ),
              SizedBox(height: 4),
              BaseTextField(
                title: "Пароль",
                hint: "** ** ** **",
                type: TextFieldType.PASSWORD,
              ),
              SizedBox(height: 4),
              BaseTextField(
                title: "Повторите пароль",
                hint: "** ** ** **",
                type: TextFieldType.PASSWORD,
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
              BaseButton(onPressed: () {}, title: "Войти"),
              SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  context.openScreen(LoginIntent());
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'У меня есть аккаунт. ',
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'Войти',
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

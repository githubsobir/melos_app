import 'package:common/base_button.dart';
import 'package:common/base_text_field.dart';
import 'package:common/custom_appbar.dart';
import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/auth_navigation_intents.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                PathImages.myPassword,
                height: 150,
                width: 212,
              ),
              SizedBox(height: 16),
              Text(
                "Ваш новый пароль должен отличаться от ранее использованного пароля.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 32),
              BaseTextField(
                title: "Пароль",
                hint: "** ** ** **",
                type: TextFieldType.PASSWORD,
              ),
              SizedBox(height: 6),
              BaseTextField(
                title: "Повторите пароль",
                hint: "** ** ** **",
                type: TextFieldType.PASSWORD,
              ),
              SizedBox(height: 32),
              BaseButton(
                  onPressed: () {
                    context.openScreen(LoginIntent());
                  },
                  title: "Изменить пароль"),
            ],
          ),
        ),
      ),
    );
  }
}

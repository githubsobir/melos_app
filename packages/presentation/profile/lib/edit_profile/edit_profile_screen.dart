import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/base_text_field.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Регистрация"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 8,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          "Доверенность",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Image.asset(
                          alignment: Alignment.center,
                          PathImages.image11,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        BaseButton(onPressed: () {}, title: "Изменить")
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        Text(
                          "Страховка",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Image.asset(
                          alignment: Alignment.center,
                          PathImages.image11,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        BaseButton(onPressed: () {}, title: "Изменить")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child: BaseButton(
                onPressed: () {
                  context.closeActiveScreen();
                },
                title: "Сохранять",
                background: const Color(0xFF008A22),
              ),
            )
          ],
        ),
      ),
    );
  }
}

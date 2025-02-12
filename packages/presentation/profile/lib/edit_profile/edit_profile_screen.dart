import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController middleNameLicenseController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passportPinflController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ваш аккаунт"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BaseTextField(
                    controller: lastNameController,
                    title: "Фамилия",
                    hint: "Фамилия",
                  ),
                  const SizedBox(height: 8),
                  BaseTextField(
                    controller: firstNameController,
                    title: "Имя",
                    hint: "Имя",
                  ),
                  const SizedBox(height: 8),
                  BaseTextField(
                    controller: middleNameLicenseController,
                    title: "Очества",
                    hint: "Очества",
                  ),
                  const SizedBox(height: 8),
                  BaseTextField(
                    controller: phoneController,
                    title: "Контактный телефон",
                    hint: "__ ___ __ __",
                  ),
                  const SizedBox(height: 8),
                  BaseTextField(
                    controller: passportPinflController,
                    title: "ПИНФЛ",
                    hint: "ПИНФЛ",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 48,
                bottom: 24,
                left: 24,
                right: 24,
              ),
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

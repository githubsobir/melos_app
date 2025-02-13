import 'package:common/l10n/build_context_extension.dart';
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
        title: Text(context.translations.your_account),
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
                    title: context.translations.surname,
                    hint: context.translations.surname,
                  ),
                  const SizedBox(height: 8),
                  BaseTextField(
                    controller: firstNameController,
                    title: context.translations.name,
                    hint: context.translations.name,
                  ),
                  const SizedBox(height: 8),
                  BaseTextField(
                    controller: middleNameLicenseController,
                    title: context.translations.patronymics,
                    hint: context.translations.patronymics,
                  ),
                  const SizedBox(height: 8),
                  BaseTextField(
                    controller: phoneController,
                    title: context.translations.contact_phone,
                    hint: "__ ___ __ __",
                  ),
                  const SizedBox(height: 8),
                  BaseTextField(
                    controller: passportPinflController,
                    title: context.translations.pinfl,
                    hint: context.translations.pinfl,
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
                title: context.translations.save,
                background: const Color(0xFF008A22),
              ),
            )
          ],
        ),
      ),
    );
  }
}

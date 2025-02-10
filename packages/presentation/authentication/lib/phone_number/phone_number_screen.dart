import 'package:authentication/phone_number/phone_number_cubit.dart';
import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/base_text_field.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';

class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({super.key, required this.isRegister});

  final bool isRegister;

  final cubit = PhoneNumberCubit(inject());

  final TextEditingController phoneController = TextEditingController();

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
              Image.asset(
                PathImages.forgotPassword,
                height: 150,
                width: 212,
              ),
              SizedBox(height: 16),
              Text(
                "Введите свой номер, чтобы получить проверочный код!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 16),
              BaseTextField(
                title: "Контактный телефон",
                hint: "+998 __ ___ __ __",
                type: TextFieldType.PHONE,
                controller: phoneController,
              ),
              SizedBox(height: 42),
              BaseButton(
                  onPressed: () {
                    context.openScreen(OtpCodeIntent(
                      phoneNumber: phoneController.text,
                      isRegister: isRegister,
                    ));
                  },
                  title: "Отправлять"),
            ],
          ),
        ),
      ),
    );
  }
}

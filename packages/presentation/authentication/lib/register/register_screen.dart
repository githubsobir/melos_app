import 'package:authentication/register/register_cubit.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/base_loader_builder.dart';
import 'package:common/widgets/base_text_field.dart';
import 'package:common/widgets/custom_functions.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/main_navigation_intents.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key, required this.phoneNumber});

  final String phoneNumber;
  final cubit = RegisterCubit(inject());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  // final TextEditingController phoneController = TextEditingController();
  final TextEditingController driverLicenseController = TextEditingController();
  final TextEditingController middleNameLicenseController =
      TextEditingController();
  final TextEditingController passportPinflController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(context.translations.registration),
      ),
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          FocusManager.instance.primaryFocus?.unfocus();
          if (state is EmptyFieldsErrorState) {
            showToast(context.translations.please_fill_in_all_fields);
          } else if (state is RegisterErrorState) {
            showToast(state.message);
          } else if (state is SuccessfullyRegisteredState) {
            context.openScreen(MainIntent());
          }
        },
        builder: (context, state) => BaseLoaderBuilder(
          hasLoading: state is LoaderState,
          child: SingleChildScrollView(
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
                    controller: lastNameController,
                    title: context.translations.surname,
                    hint: context.translations.surname,
                    type: TextFieldType.NAME,
                  ),
                  SizedBox(height: 4),
                  BaseTextField(
                    controller: firstNameController,
                    title: context.translations.name,
                    hint: context.translations.name,
                    type: TextFieldType.NAME,
                  ),
                  SizedBox(height: 4),
                  BaseTextField(
                    controller: middleNameLicenseController,
                    title: context.translations.patronymics,
                    hint: context.translations.patronymics,
                    type: TextFieldType.NAME,
                  ),
                  SizedBox(height: 4),
                  BaseTextField(
                    controller: passportPinflController,
                    title: context.translations.pinfl,
                    hint: context.translations.pinfl,
                    type: TextFieldType.NUMBER,
                  ),
                  SizedBox(height: 4),
                  BaseTextField(
                    controller: driverLicenseController,
                    title: context.translations.drivers_license,
                    hint: context.translations.drivers_license,
                    type: TextFieldType.NUMBER_TEXT,
                  ),
                  SizedBox(height: 4),
                  BaseTextField(
                    controller: passwordController,
                    title: context.translations.password,
                    hint: "** ** ** **",
                    type: TextFieldType.PASSWORD,
                  ),
                  SizedBox(height: 4),
                  BaseTextField(
                    controller: confirmPasswordController,
                    title: context.translations.repeat_password,
                    hint: "** ** ** **",
                    type: TextFieldType.PASSWORD,
                  ),
                  const SizedBox(height: 42),
                  BaseButton(
                    onPressed: () {
                      cubit.register(
                        firstName: firstNameController.text,
                        phoneNumber: phoneNumber,
                        password: passwordController.text,
                        confirmPassword: confirmPasswordController.text,
                        lastName: lastNameController.text,
                        driverLicense: driverLicenseController.text,
                        middleName: middleNameLicenseController.text,
                        passportPinfl: passportPinflController.text,
                      );
                    },
                    title: context.translations.enter,
                  ),
                  SizedBox(height: 32),
                  GestureDetector(
                    onTap: () {
                      context.openScreen(LoginIntent());
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: context.translations.i_have_an_account,
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: context.translations.enter,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          TextSpan(
                            text: '?!',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

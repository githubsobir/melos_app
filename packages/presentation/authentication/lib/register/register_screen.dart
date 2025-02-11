import 'package:authentication/register/register_cubit.dart';
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
  RegisterScreen({super.key});

  final cubit = RegisterCubit(inject());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController driverLicenseController = TextEditingController();
  final TextEditingController middleNameLicenseController =
      TextEditingController();
  // final TextEditingController roleController = TextEditingController();
  final TextEditingController passportPinflController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Регистрация"),
      ),
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          if (state is EmptyFieldsErrorState) {
            showToast("Пожалуйста, заполните все поля");
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
                    title: "Фамилия",
                    hint: "Фамилия",
                  ),
                  SizedBox(height: 4),
                  BaseTextField(
                    controller: firstNameController,
                    title: "Имя",
                    hint: "Имя",
                  ),
                  SizedBox(height: 4),
                  BaseTextField(
                    controller: middleNameLicenseController,
                    title: "Очества",
                    hint: "Очества",
                  ),
                  SizedBox(height: 4),
                  BaseTextField(
                    controller: phoneController,
                    title: "Контактный телефон",
                    hint: "__ ___ __ __",
                  ),
                  SizedBox(height: 4),
                  BaseTextField(
                    controller: passportPinflController,
                    title: "ПИНФЛ",
                    hint: "ПИНФЛ",
                  ),
                  SizedBox(height: 4),
                  BaseTextField(
                    controller: driverLicenseController,
                    title: "Вод Прав",
                    hint: "Вод Прав",
                  ),
                  SizedBox(height: 4),
                  BaseTextField(
                    controller: passwordController,
                    title: "Пароль",
                    hint: "** ** ** **",
                    type: TextFieldType.PASSWORD,
                  ),
                  SizedBox(height: 4),
                  BaseTextField(
                    controller: confirmPasswordController,
                    title: "Повторите пароль",
                    hint: "** ** ** **",
                    type: TextFieldType.PASSWORD,
                  ),
                  SizedBox(height: 42),
                  BaseButton(
                      onPressed: () {
                        cubit.register(
                          firstName: firstNameController.text,
                          phoneNumber: phoneController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                          lastName: lastNameController.text,
                          driverLicense: driverLicenseController.text,
                          middleName: middleNameLicenseController.text,
                          passportPinfl: passportPinflController.text,
                        );
                      },
                      title: "Войти"),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

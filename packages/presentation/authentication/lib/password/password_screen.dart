import 'package:authentication/password/password_cubit.dart';
import 'package:common/base_button.dart';
import 'package:common/base_loader_builder.dart';
import 'package:common/base_text_field.dart';
import 'package:common/custom_functions.dart';
import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:common/path_images.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/main_navigation_intents.dart';

class PasswordScreen extends StatelessWidget {
  PasswordScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  final cubit = PasswordCubit(inject());

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Авторизоваться"),
      ),
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          if (state is EmptyFieldsErrorState) {
            showToast("Пожалуйста, заполните все поля");
          } else if (state is LoginErrorState) {
            showToast("Ошибка регистрации");
          } else if (state is SuccessfullyLoginState) {
            context.openScreen(MainIntent());
          }
        },
        builder: (context, state) {
          return BaseLoaderBuilder(
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
                    const SizedBox(height: 16),
                    BaseTextField(
                      controller: passwordController,
                      title: "Пароль",
                      hint: "Пароль",
                      type: TextFieldType.PASSWORD,
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        context.openScreen(ForgotPasswordIntent(phoneNumber: phoneNumber));
                      },
                      child: Text(
                        "Забыли пароль?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 42),
                    BaseButton(
                        onPressed: () {
                          cubit.login(
                              phone: "+998$phoneNumber",
                              password: passwordController.text); //123
                        },
                        title: "Войти"),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

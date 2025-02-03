import 'package:authentication/forgot_password/forgot_password_cubit.dart';
import 'package:common/base_button.dart';
import 'package:common/base_loader_builder.dart';
import 'package:common/base_text_field.dart';
import 'package:common/custom_appbar.dart';
import 'package:common/custom_functions.dart';
import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:common/path_images.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  final cubit = ForgotPasswordCubit(inject());
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          if (state is EmptyFieldsErrorState) {
            showToast("Пожалуйста, заполните все поля");
          } else if (state is ErrorState) {
            showToast(state.message);
          } else if (state is SuccessfullyChangedState) {
            context.openScreen(LoginIntent());
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
                      controller: newPasswordController,
                      title: "Пароль",
                      hint: "** ** ** **",
                      type: TextFieldType.PASSWORD,
                    ),
                    SizedBox(height: 6),
                    BaseTextField(
                      controller: confirmPasswordController,
                      title: "Повторите пароль",
                      hint: "** ** ** **",
                      type: TextFieldType.PASSWORD,
                    ),
                    SizedBox(height: 32),
                    BaseButton(
                        onPressed: () {
                          cubit.forgotPassword(
                            phone: "+998$phoneNumber",
                            newPassword: newPasswordController.text,
                            confirmPassword: confirmPasswordController.text,
                          );
                        },
                        title: "Изменить пароль"),
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

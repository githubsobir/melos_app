import 'package:authentication/forgot_password/forgot_password_cubit.dart';
import 'package:authentication/register/register_screen.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/base_loader_builder.dart';
import 'package:common/widgets/base_text_field.dart';
import 'package:common/widgets/custom_appbar.dart';
import 'package:common/widgets/custom_functions.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:intent_launcher/intent_launcher.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  final cubit = ForgotPasswordCubit(inject());
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FlutterPwValidatorState> validatorKey123 =
  GlobalKey<FlutterPwValidatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          FocusManager.instance.primaryFocus?.unfocus();
          if (state is EmptyFieldsErrorState) {
            showToastSms(context.translations.please_fill_in_all_fields);
          } else if (state is ErrorState) {
            showToastSms(state.message);
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
                    const SizedBox(height: 16),
                    Text(
                      context.translations.new_password_difference,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 32),
                    BaseTextField(
                      controller: newPasswordController,
                      title: context.translations.password,
                      hint: "** ** ** **",
                      type: TextFieldType.PASSWORD,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: MediaQuery.of(context).size.height > 900
                          ? MediaQuery.of(context).size.height * 0.25
                          : MediaQuery.of(context).size.height > 800
                              ? MediaQuery.of(context).size.height * 0.28
                              : MediaQuery.of(context).size.height > 700
                                  ? MediaQuery.of(context).size.height * 0.3
                                  : MediaQuery.of(context).size.height > 600
                                      ? MediaQuery.of(context).size.height *
                                          0.32
                                      : MediaQuery.of(context).size.height *
                                          0.25,
                      child: SingleChildScrollView(
                        child: FlutterPwValidator(
                          key: validatorKey123,
                          controller: newPasswordController,
                          minLength: 8,
                          uppercaseCharCount: 1,
                          lowercaseCharCount: 1,
                          numericCharCount: 1,
                          specialCharCount: 1,
                          width: 350,
                          height: 210,
                          strings: FrenchStrings(context),
                          defaultColor: Colors.grey.shade600,
                          failureColor: Colors.red,
                          successColor: Colors.blueAccent.shade700,

                          onSuccess: () {
                            // print("MATCHED");
                            // ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                            //     content: new Text("Password is matched")));
                          },
                          onFail: () {
                            print("NOT MATCHED");
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    BaseButton(
                        onPressed: () {

                          if (newPasswordController.text.trim().length < 8) {
                            // showToastSms(context.translations.passwordLength);
                          } else {
                            cubit.forgotPassword(
                              phone: "+998$phoneNumber",
                              newPassword: newPasswordController.text,
                              confirmPassword: newPasswordController.text,
                            );
                          }
                        },
                        title: context.translations.change_password),
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

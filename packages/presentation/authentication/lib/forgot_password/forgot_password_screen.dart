import 'package:authentication/forgot_password/forgot_password_cubit.dart';
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
          FocusManager.instance.primaryFocus?.unfocus();
          if (state is EmptyFieldsErrorState) {
            showToast(context.translations.please_fill_in_all_fields);
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
                      context.translations.new_password_difference,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 32),
                    BaseTextField(
                      controller: newPasswordController,
                      title: context.translations.password,
                      hint: "** ** ** **",
                      type: TextFieldType.PASSWORD,
                    ),
                    SizedBox(height: 6),
                    BaseTextField(
                      controller: confirmPasswordController,
                      title: context.translations.repeat_password,
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

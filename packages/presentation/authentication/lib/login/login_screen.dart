import 'package:authentication/login/login_cubit.dart';
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

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final cubit = LoginCubit(inject());

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translations.enter),
      ),
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          FocusManager.instance.primaryFocus?.unfocus();
          if (state is EmptyFieldsErrorState) {
            showToast(context.translations.please_fill_in_all_fields);
          } else if (state is UserNotFound) {
            context.openScreen(OtpCodeIntent(
              phoneNumber: phoneController.text.replaceAll(" ", ""),
              isRegister: true,
            ));
          } else if (state is HasUser) {
            context.openScreen(PasswordScreenIntent(
                phoneNumber: phoneController.text.replaceAll(" ", "")));
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
                    const SizedBox(height: 72),
                    BaseTextField(
                      controller: phoneController,
                      title: context.translations.enter_number,
                      hint: "__ ___ __ __",
                      type: TextFieldType.PHONE,
                    ),
                    const SizedBox(height: 100),
                    BaseButton(
                        onPressed: () {
                          cubit.verifyPhone(
                            phone:
                                "+998${phoneController.text.replaceAll(" ", "")}",
                          ); //123
                        },
                        title: context.translations.continue_x),
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

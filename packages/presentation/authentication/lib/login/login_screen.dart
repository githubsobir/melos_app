import 'dart:io';

import 'package:authentication/login/login_cubit.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_loader_builder.dart';
import 'package:common/widgets/base_text_field.dart';
import 'package:common/widgets/custom_functions.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/main_navigation_intents.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final cubit = LoginCubit(inject());

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
              children: [
                AppBar(
                  title: Text(context.translations.enter),
                  leading: IconButton(
                    icon: Platform.isIOS
                        ? const Icon(
                            Icons.arrow_back_ios_new,

                          )
                        : const Icon(
                            Icons.arrow_back,

                          ),
                    onPressed: () {

                      context.openScreen(MainIntent(keyLogout: 0));

                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            PathImages.carLogin,
                            height: 150,
                            width: 212,
                          ),
                          const SizedBox(height: 65),
                          BaseTextField(
                            controller: phoneController,
                            title: context.translations.enter_number,
                            hint: "__ ___ __ __",
                            type: TextFieldType.PHONE,
                          ),
                          const SizedBox(height: 45),

                          InkWell(
                            borderRadius: BorderRadius.circular(8.0),
                            onTap: () {
                              cubit.verifyPhone(
                                phone:
                                    "+998${phoneController.text.replaceAll(" ", "")}",
                              );
                            },
                            child: Card(
                              color: const Color(0xFF3563E9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust radius as needed
                              ),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 8,
                                  bottom: 8,
                                ),
                                child: Text(
                                  context.translations.continue_x,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 18,
                                        color: Theme.of(context)
                                                    .colorScheme
                                                    .brightness ==
                                                Brightness.light
                                            ? Colors.white
                                            : Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          )

                          // BaseButton(
                          //     onPressed: () {
                          //       cubit.verifyPhone(
                          //         phone:
                          //             "+998${phoneController.text.replaceAll(" ", "")}",
                          //       ); //123
                          //     },
                          //     title: context.translations.continue_x),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:authentication/register/register_cubit.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/base_loader_builder.dart';
import 'package:common/widgets/base_text_field.dart';
import 'package:common/widgets/custom_functions.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/Resource/Strings.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/main_navigation_intents.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key, required this.phoneNumber});

  final String phoneNumber;
  final cubit = RegisterCubit(inject());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController driverLicenseController = TextEditingController();
  final TextEditingController middleNameLicenseController =
      TextEditingController();
  final TextEditingController passportPinflController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();

  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translations.registration),
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
                    PathImages.car2025,
                    height: 150,
                    width: 212,
                  ),
                  BaseTextField(
                    controller: lastNameController,
                    title: context.translations.surname,
                    hint: context.translations.surname,
                    type: TextFieldType.NAME,
                  ),
                  const SizedBox(height: 4),
                  BaseTextField(
                    controller: firstNameController,
                    title: context.translations.name,
                    hint: context.translations.name,
                    type: TextFieldType.NAME,
                  ),
                  const SizedBox(height: 4),
                  BaseTextField(
                    controller: middleNameLicenseController,
                    title: context.translations.patronymics,
                    hint: context.translations.patronymics,
                    type: TextFieldType.NAME,
                  ),
                  const SizedBox(height: 4),
                  BaseTextField(
                    controller: passportPinflController,
                    title: context.translations.pinfl,
                    hint: context.translations.pinfl,
                    type: TextFieldType.NUMBER,
                  ),
                  const SizedBox(height: 4),
                  BaseTextField(
                    controller: driverLicenseController,
                    title: context.translations.drivers_license,
                    hint: context.translations.drivers_license,
                    type: TextFieldType.NUMBER_TEXT,
                  ),
                  const SizedBox(height: 4),
                  BaseTextField(
                    controller: passwordController,
                    title: context.translations.password,
                    hint: "** ** ** **",
                    type: TextFieldType.PASSWORD,
                  ),
                  const SizedBox(height: 20),
                  // BaseTextField(
                  //   controller: confirmPasswordController,
                  //   title: context.translations.repeat_password,
                  //   hint: "** ** ** **",
                  //   type: TextFieldType.PASSWORD,
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height > 900
                        ? MediaQuery.of(context).size.height * 0.26
                        : MediaQuery.of(context).size.height > 800
                            ? MediaQuery.of(context).size.height * 0.28
                            : MediaQuery.of(context).size.height > 700
                                ? MediaQuery.of(context).size.height * 0.3
                                : MediaQuery.of(context).size.height > 600
                                    ? MediaQuery.of(context).size.height * 0.32
                                    : MediaQuery.of(context).size.height * 0.25,
                    child: SingleChildScrollView(
                      child: FlutterPwValidator(
                        key: validatorKey,
                        controller: passwordController,

                        minLength: 8,
                        uppercaseCharCount: 1,
                        lowercaseCharCount: 1,
                        numericCharCount: 1,
                        specialCharCount: 1,
                        width: 350,
                        height: 200,
                        strings: FrenchStrings(context),
                        defaultColor: Colors.grey.shade600,
                        failureColor: Colors.red,
                        successColor: Colors.blueAccent.shade700,
                        onSuccess: () {
                          print("MATCHED");
                          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                              content: new Text("Password is matched")));
                        },
                        onFail: () {
                          print("NOT MATCHED");
                        },
                      ),
                    ),
                  ),
                  BaseButton(
                    onPressed: () {
                      if (firstNameController.text.trim().length < 2) {
                        showToast(
                            "${context.translations.name} ${context.translations.more2Name}");
                      } else if (lastNameController.text.trim().length < 2) {
                        showToast(
                            "${context.translations.surname} ${context.translations.more2Firstname}");
                      } else if (middleNameLicenseController.text
                              .trim()
                              .length <
                          2) {
                        showToast(
                            "${context.translations.patronymics} ${context.translations.more2LastName}");
                      } else if (passportPinflController.text.trim().length != 14) {
                        showToast(
                            "${context.translations.pinfl} ${context.translations.pnfl}");
                      } else if (driverLicenseController.text.trim().length < 9 ) {
                        showToast(context.translations.driverLicense);
                      } else if (passwordController.text.trim().length < 8) {
                        showToast(context.translations.passwordLength);
                      } else {
                        cubit.register(
                            firstName: firstNameController.text,
                            phoneNumber: "+998$phoneNumber",
                            password: passwordController.text,
                            confirmPassword: passwordController.text,
                            lastName: lastNameController.text,
                            driverLicense: driverLicenseController.text,
                            middleName: middleNameLicenseController.text,
                            passportPinfl: passportPinflController.text);
                      }
                    },
                    title: context.translations.enter,
                  ),
                  const SizedBox(height: 32),
                  // const SizedBox(height: 32),
                  // GestureDetector(
                  //   onTap: () {
                  //     context.openScreen(LoginIntent());
                  //   },
                  //   child: RichText(
                  //     textAlign: TextAlign.center,
                  //     text: TextSpan(
                  //       text: context.translations.i_have_an_account,
                  //       style: Theme.of(context).textTheme.bodyMedium,
                  //       children: [
                  //         TextSpan(
                  //           text: context.translations.enter,
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .bodyMedium
                  //               ?.copyWith(
                  //                   color:
                  //                       Theme.of(context).colorScheme.primary),
                  //         ),
                  //         TextSpan(
                  //           text: '?!',
                  //           style: Theme.of(context).textTheme.bodyMedium,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FrenchStrings implements FlutterPwValidatorStrings {
  BuildContext context;

  FrenchStrings(this.context);

  @override
  // TODO: implement atLeast
  String get atLeast => context.translations.passwordLength;

  @override
  // TODO: implement normalLetters
  String get normalLetters => "";

  @override
  // TODO: implement numericCharacters
  String get numericCharacters => context.translations.enterNumber;

  @override
  // TODO: implement specialCharacters
  String get specialCharacters => context.translations.enterSpecialSymbols;

  @override
  // TODO: implement uppercaseLetters
  String get uppercaseLetters => context.translations.enterCapitalLatter;

  @override
  // TODO: implement lowercaseLetters
  String get lowercaseLetters => context.translations.enterLowerCase;
}

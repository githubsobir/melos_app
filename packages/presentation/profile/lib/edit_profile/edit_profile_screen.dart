import 'package:common/l10n/build_context_extension.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/base_text_field.dart';
import 'package:common/widgets/custom_functions.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/model/profile/user_information_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:profile/edit_profile/edit_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key, required this.info});

  final UserInformationModel info;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController middleNameLicenseController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passportPinflController = TextEditingController();
  final TextEditingController driverLicenseController = TextEditingController();

  final cubit = EditCubit(inject());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translations.your_account),
      ),
      body: BlocConsumer<EditCubit, EditState>(
        bloc: cubit,
        listener: (context, state) {
          FocusManager.instance.primaryFocus?.unfocus();
          if (state is EmptyFieldsErrorState) {
            showToast(context.translations.please_fill_in_all_fields);
          } else if (state is UpdateErrorState) {
            showToast(state.message);
          } else if (state is UserUpdatedState) {
            context.closeActiveScreen(true);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BaseTextField(
                        controller: firstNameController
                          ..text = info.firstName ?? "",
                        title: context.translations.name,
                        hint: context.translations.name,
                      ),
                      const SizedBox(height: 8),
                      BaseTextField(
                        controller: lastNameController
                          ..text = info.lastName ?? "",
                        title: context.translations.surname,
                        hint: context.translations.surname,
                      ),
                      const SizedBox(height: 8),
                      BaseTextField(
                        controller: middleNameLicenseController
                          ..text = info.middleName ?? "",
                        title: context.translations.patronymics,
                        hint: context.translations.patronymics,
                      ),
                      const SizedBox(height: 8),
                      BaseTextField(
                        controller: phoneController
                          ..text =
                              (info.phoneNumber ?? "").replaceAll("+998", ""),
                        title: context.translations.contact_phone,
                        hint: "__ ___ __ __",
                        type: TextFieldType.PHONE,
                      ),
                      const SizedBox(height: 8),
                      BaseTextField(
                        controller: passportPinflController
                          ..text = info.passportPinfl ?? "",
                        title: context.translations.pinfl,
                        hint: context.translations.pinfl,
                        type: TextFieldType.NUMBER,
                      ),
                      const SizedBox(height: 8),
                      BaseTextField(
                        controller: driverLicenseController
                          ..text = info.driverLicense ?? "",
                        title: context.translations.drivers_license,
                        hint: context.translations.drivers_license,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 48,
                    bottom: 24,
                    left: 24,
                    right: 24,
                  ),
                  child: BaseButton(
                    onPressed: () {
                      cubit.updateUser(
                        phoneNumber:
                            "+998${phoneController.text.replaceAll(" ", "")}",
                        driverLicense: driverLicenseController.text,
                        passportPinfl: passportPinflController.text,
                        middleName: middleNameLicenseController.text,
                        lastName: lastNameController.text,
                        firstName: firstNameController.text,
                      );
                    },
                    title: context.translations.save,
                    background: const Color(0xFF008A22),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

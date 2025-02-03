import 'package:authentication/otp_code_screen/otp_code_cubit.dart';
import 'package:common/base_button.dart';
import 'package:common/base_loader_builder.dart';
import 'package:common/custom_functions.dart';
import 'package:common/custom_otp.dart';
import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';

class OtpCodeScreen extends StatelessWidget {
  final String phoneNumber;
  final bool isRegister;

  OtpCodeScreen({
    super.key,
    required this.phoneNumber,
    required this.isRegister,
  }) {
    cubit.sendSms(phone: "+998$phoneNumber");
  }

  final cubit = OtpCodeCubit(inject());
  String smsCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          if (state is EmptyFieldsErrorState) {
            showToast("Пожалуйста, заполните все поля");
          } else if (state is ErrorState) {
            showToast(state.message);
          } else if (state is SuccessfullyVerifiedState) {
            context.openScreen(RegisterIntent());
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
                    const SizedBox(
                      height: 150,
                    ),
                    Text(
                      "Аутентификация",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Пожалуйста, введите код аутентификации, отправленный на вашу электронную почту",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 32),
                    CustomOtp(
                      onPinEntered: (String code) {
                        smsCode = code;
                      },
                    ),
                    const SizedBox(height: 32),
                    BaseButton(
                      onPressed: () {
                        cubit.verifySmsCode(
                            phone: "+998$phoneNumber", smsCode: smsCode);
                      },
                      title: "Отправлять",
                    ),
                    const SizedBox(height: 32),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Не получили код?",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
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

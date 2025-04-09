import 'package:authentication/otp_code_screen/otp_code_cubit.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/base_loader_builder.dart';
import 'package:common/widgets/custom_functions.dart';
import 'package:common/widgets/custom_otp.dart';
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
            FocusManager.instance.primaryFocus?.unfocus();
            showToast(context.translations.please_fill_in_all_fields);
          } else if (state is ErrorState) {
            FocusManager.instance.primaryFocus?.unfocus();
            showToast(state.message);
          } else if (state is SuccessfullyVerifiedState) {
            FocusManager.instance.primaryFocus?.unfocus();
            if (isRegister) {
              context.openScreen(RegisterIntent(phoneNumber: phoneNumber));
            } else {
              context
                  .openScreen(ForgotPasswordIntent(phoneNumber: phoneNumber));
            }
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
                      context.translations.authentication,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      context.translations.enter_the_code,
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
                      title: context.translations.send,
                    ),
                    const SizedBox(height: 32),
                    GestureDetector(
                      onTap: () {
                        if (state is TimerState) {
                          if (state.seconds == 0) {
                            cubit.sendSms(phone: "+998$phoneNumber");
                          }
                        }
                      },
                      child: Text(
                        (state is TimerState)
                            ? state.seconds != 0
                                ? formatDuration(state.seconds)
                                : context.translations.did_not_receive_the_code
                            : context.translations.did_not_receive_the_code,
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

  String formatDuration(int totalSeconds) {
    int minutes = totalSeconds ~/ 60; // Daqiqani olish
    int seconds = totalSeconds % 60; // Qolgan soniyalar
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}

import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/custom_functions.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:main/payment_details/payment/payment_cubit.dart';

class PaymentBottomSheet extends StatelessWidget {
  final num paymentId;

  PaymentBottomSheet({super.key, required this.paymentId}) {
    cubit.checkStatus(paymentId);
  }

  final PaymentCubit cubit = PaymentCubit(inject());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ), // Adjust radius as needed
        ),
        margin: const EdgeInsets.all(0),
        child: BlocBuilder<PaymentCubit, PaymentState>(
          bloc: cubit,
          builder: (context, state) {
            if (state.status.status == 1) {
              return SizedBox(
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: 64,
                        height: 64,
                        child: Column(
                          children: [
                            SvgPicture.asset(PathImages.paymentSuccessfully),
                          ],
                        ),
                      ),
                      Text(
                        context.translations.payment_successfully_made,
                        textAlign: TextAlign.center,
                      ),
                      Expanded(child: Container()),
                      Column(
                        children: [
                          SizedBox(
                            width: 200,
                            child: BaseButton(
                                onPressed: () {
                                  print("bookingId: ${state.status.bookingId}");
                                  context.closeActiveScreen(
                                    state.status.bookingId,
                                  );
                                },
                                title: context.translations.next),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ));
            } else if (state.status.status == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          context.closeActiveScreen();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.close,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 64,
                    height: 64,
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                  Text(
                    context.translations.payment_is_being_processed,
                    textAlign: TextAlign.center,
                  )
                ],
              );
            } else if (state.status.status.toString() == "-1") {
              Navigator.pop(context);
              showToastSms(context.translations.paymentNotSuccess);

              return const SizedBox.shrink();
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          context.closeActiveScreen();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.close,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 64,
                    height: 64,
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                  Text(
                    context.translations.pleaseWait,
                    textAlign: TextAlign.center,
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

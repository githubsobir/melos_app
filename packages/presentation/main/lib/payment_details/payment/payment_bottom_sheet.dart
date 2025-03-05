import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
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

  static Future show(
      {required BuildContext context, required num paymentId}) async {
    var result = await showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return PaymentBottomSheet(
          paymentId: paymentId,
        );
      },
    );
    return result;
  }

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
            return SizedBox(
                height: 300,
                child: state.status.status == 1
                    ? Column(
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
                                SvgPicture.asset(
                                    PathImages.paymentSuccessfully),
                              ],
                            ),
                          ),
                          const Text(
                            "Платеж успешно произведен",
                            textAlign: TextAlign.center,
                          ),
                          Expanded(child: Container()),
                          Column(
                            children: [
                              SizedBox(
                                width: 200,
                                child: BaseButton(
                                    onPressed: () {
                                      context.closeActiveScreen();
                                    },
                                    title: "Дальше"),
                              ),
                            ],
                          )
                        ],
                      )
                    : const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            width: 64,
                            height: 64,
                            child: Column(
                              children: [
                                CircularProgressIndicator(),
                              ],
                            ),
                          ),
                          Text(
                            "Платеж обрабатывается",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ));
          },
        ),
      ),
    );
  }
}

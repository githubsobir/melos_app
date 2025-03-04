import 'package:flutter/material.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({super.key});

  static Future show({
    required BuildContext context,
  }) async {
    var result = await showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const PaymentBottomSheet();
      },
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ), // Adjust radius as needed
        ),
        margin: EdgeInsets.all(0),
        child: SizedBox(
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 24,
              ),
              SizedBox(
                width: 56,
                height: 56,
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
          ),
        ),
      ),
    );
  }
}

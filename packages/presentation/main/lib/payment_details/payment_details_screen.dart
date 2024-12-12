import 'package:common/custom_appbar.dart';
import 'package:flutter/material.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(context: context,title: Text("Payment"),),
      // body: ,
    );
  }
}

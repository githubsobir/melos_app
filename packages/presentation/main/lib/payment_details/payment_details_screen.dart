import 'package:flutter/material.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Text(
                  "Резюме аренды",
                  style: Theme.of(context).textTheme.bodyMedium!,
                ),
                Text(
                  "Резюме аренды",
                  style: Theme.of(context).textTheme.bodyMedium!,
                )
              ],
            ),
          ),
          SizedBox(height: 24,),
          Card(
            child: Column(
              children: [
                Text(
                  "Резюме аренды",
                  style: Theme.of(context).textTheme.bodyMedium!,
                ),
                Text(
                  "Резюме аренды",
                  style: Theme.of(context).textTheme.bodyMedium!,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

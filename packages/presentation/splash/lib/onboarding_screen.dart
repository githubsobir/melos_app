import 'package:common/base_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toast"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "SSSSSSSSSSSSS",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "EEEEEEEEEEE",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 16,
            ),
            BaseButton(
              title: "Next",
              onPressed: () {},
            ),

          ],
        ),
      ),
    );
  }
}

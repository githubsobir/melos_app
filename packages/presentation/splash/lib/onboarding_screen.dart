import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toast"),
      ),
      body: Column(
        children: [
          Text(
            "SSSSSSSSSSSSS",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "EEEEEEEEEEE",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          FilledButton(
              onPressed: () {},
              child: Text(
                "EEEEEEEEEEE",
                style: Theme.of(context).textTheme.bodyMedium,
              ))
        ],
      ),
    );
  }
}

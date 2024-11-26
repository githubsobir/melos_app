import 'package:common/base_button.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Hello",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Grey",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 16,
            ),
            BaseButton(
              title: context.translations.next,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

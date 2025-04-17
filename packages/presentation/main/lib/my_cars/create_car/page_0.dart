import 'package:common/l10n/build_context_extension.dart';
import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';

class Page0 extends StatelessWidget {
  const Page0({super.key, required this.onStart});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      // height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.translations.rent_out_your_car_with_ease,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            context.translations.earn_extra_income_text,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            context.translations.what_you_will_need_to_get_started,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            context.translations.what_you_will_need_to_get_started_text,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: 24,
          ),
          BaseButton(onPressed: onStart, title: context.translations.begin)
        ],
      ),
    );
  }
}

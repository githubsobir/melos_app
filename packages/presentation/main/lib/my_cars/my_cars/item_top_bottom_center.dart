import 'package:flutter/material.dart';

class ItemTopBottomCenter extends StatelessWidget {
  final String leftText;
  final String rightText;

  const ItemTopBottomCenter(
      {super.key, required this.leftText, required this.rightText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          leftText,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Theme.of(context)
                      .colorScheme
                      .secondary),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          rightText,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontWeight: FontWeight.w700, fontSize: 12),
        ),
      ],
    );
  }
}

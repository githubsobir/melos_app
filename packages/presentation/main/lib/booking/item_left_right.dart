import 'package:flutter/material.dart';

class ItemLeftRight extends StatelessWidget {
  final String leftText;
  final String rightText;

  const ItemLeftRight(
      {super.key, required this.leftText, required this.rightText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            leftText,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Theme.of(context)
                        .colorScheme
                        .secondary),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          flex: 3,
          child: Text(
            rightText,
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontWeight: FontWeight.w700, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

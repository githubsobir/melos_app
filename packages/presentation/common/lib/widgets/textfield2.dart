import 'package:flutter/material.dart';

class TextField2 extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String hint;
  final Color? fillColor;

  const TextField2(
      {super.key,
      this.controller,
      required this.title,
      required this.hint,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: 12,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: fillColor ??
                (Theme.of(context).colorScheme.brightness == Brightness.light
                    ? const Color(0xFFF6F7F9)
                    : const Color(0xFF061136)),
            filled: true,
            hintText: hint,
            hintStyle: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

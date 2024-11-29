import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    this.controller,
    required this.title,
    this.hint,
    super.key,
  });

  final String title;
  final String? hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextField(
          controller: controller,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .labelMedium,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 12, top: 0, bottom: 0, right: 12),
            hintText: hint,
            hintStyle: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Theme.of(context).hintColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xFFC0D8FF),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color(0xFFC0D8FF),
              ),
            ),
          ),
        )
      ],
    );
  }
}

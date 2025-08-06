import 'package:flutter/material.dart';

class TextField3 extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  final GestureTapDownCallback? onTap;
  final TextInputType? keyboardType;

  const TextField3({
    super.key,
    this.controller,
    required this.hint,
    this.onChanged,
    this.keyboardType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,

      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      readOnly: onTap != null,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 12,
          bottom: 12,
        ),
        // fillColor:
        // Theme.of(context).colorScheme.brightness == Brightness.light
        //     ? const Color(0xFFF6F7F9)
        //     : const Color(0xFF061136),
        filled: true,
        hintText: hint,
        hintStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: Theme.of(context).colorScheme.secondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color(0xFF658DF1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color(0xFF658DF1)),
        ),
        suffixIconConstraints: const BoxConstraints(maxHeight: 40),
        suffixIcon: onTap != null
            ? GestureDetector(
                onTapDown: (details) {
                  onTap!(details);
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 8),
                  width: 24,
                  height: 24,
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xff7498F2),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

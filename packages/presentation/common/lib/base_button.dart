import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color background;

  const BaseButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.background = const Color(0xFF3563E9)});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // <-- Radius
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color:
                  Theme.of(context).colorScheme.brightness == Brightness.light
                      ? Colors.white
                      : Colors.white,
            ),
      ),
    );
  }
}

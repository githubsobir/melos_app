import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback onPressed;
  String title;

  BaseButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
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
      // child: Text(title),
    );
  }
}

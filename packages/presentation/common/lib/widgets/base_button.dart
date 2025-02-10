import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color background;
  final double fontSize;

  const BaseButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.fontSize = 18,
    this.background = const Color(0xFF3563E9),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: onPressed == null ? Colors.grey : background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Adjust radius as needed
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: fontSize,
                  color: Theme.of(context).colorScheme.brightness ==
                          Brightness.light
                      ? Colors.white
                      : Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}

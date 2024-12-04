import 'package:common/masked_text_input_formatter.dart';
import 'package:flutter/material.dart';

enum TextFieldType { BASE, PHONE, PASSWORD }

class BaseTextField extends StatefulWidget {
  const BaseTextField({
    this.controller,
    required this.title,
    this.type = TextFieldType.BASE,
    this.hint,
    super.key,
  });

  final TextFieldType type;
  final String title;
  final String? hint;
  final TextEditingController? controller;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  bool isSecured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        if (widget.type == TextFieldType.BASE)
          TextField(
            controller: widget.controller,
            maxLines: 1,
            style: Theme.of(context).textTheme.labelMedium,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 12, top: 0, bottom: 0, right: 12),
              hintText: widget.hint,
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
        else if (widget.type == TextFieldType.PASSWORD)
          TextField(
            controller: widget.controller,
            obscureText: isSecured,
            obscuringCharacter: "*",
            maxLines: 1,
            style: Theme.of(context).textTheme.labelMedium,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 12, top: 0, bottom: 0, right: 12),
              hintText: widget.hint,
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
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  isSecured ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFF596780),
                ),
                onPressed: () {
                  setState(() {
                    isSecured = !isSecured;
                  });
                },
              ),
            ),
          )
        else if (widget.type == TextFieldType.PHONE)
          TextField(
            controller: widget.controller,
            maxLines: 1,
            style: Theme.of(context).textTheme.labelMedium,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              MaskedTextInputFormatter(mask: "xx xxx xx xx", separator: " "),
            ],
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 12, top: 0, bottom: 0, right: 12),
              hintText: widget.hint,
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

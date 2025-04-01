import 'package:common/masked_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextFieldType { BASE, PHONE, PASSWORD, NUMBER, NAME, NUMBER_TEXT }

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
        SizedBox(
          height: 4,
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
        else if (widget.type == TextFieldType.NAME)
          TextField(
            controller: widget.controller,
            maxLines: 1,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
            ],
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
        else if (widget.type == TextFieldType.NUMBER_TEXT)
          TextField(
            controller: widget.controller,
            maxLines: 1,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z1-9]")),
            ],
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
        else if (widget.type == TextFieldType.NUMBER)
          TextField(
            controller: widget.controller,
            maxLines: 1,
            style: Theme.of(context).textTheme.labelMedium,
            keyboardType: TextInputType.number,
            inputFormatters: [
              MaskedTextInputFormatter(mask: "xxxxxxxxxxxxxx", separator: ""),
              FilteringTextInputFormatter.allow(RegExp("[1-9]")),
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Color(0xFFC0D8FF),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16,
                ),
                Text(
                  "+998",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelMedium,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      MaskedTextInputFormatter(
                          mask: "xx xxx xx xx", separator: " "),
                    ],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          left: 2, top: 0, bottom: 0, right: 12),
                      hintText: widget.hint,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Theme.of(context).hintColor),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}

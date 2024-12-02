import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOtp extends StatefulWidget {
  Function(String code) onPinEntered;
  bool invalidCode = false;

  CustomOtp({Key? key, required this.onPinEntered, this.invalidCode = false})
      : super(key: key);

  @override
  State<CustomOtp> createState() => _CustomOtpState();
}

class _CustomOtpState extends State<CustomOtp> {
  TextEditingController? contrller1;
  TextEditingController? contrller2;
  TextEditingController? contrller3;
  TextEditingController? contrller4;

  List<String> codes = ["", "", "", ""];

  @override
  void initState() {
    super.initState();
    contrller1 = TextEditingController();
    contrller2 = TextEditingController();
    contrller3 = TextEditingController();
    contrller4 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _textFieldOTP(
            first: true, last: false, controller: contrller1, position: 0),
        _textFieldOTP(
            first: false, last: false, controller: contrller2, position: 1),
        _textFieldOTP(
            first: false, last: false, controller: contrller3, position: 2),
        _textFieldOTP(
            first: false, last: true, controller: contrller4, position: 3),
      ],
    );
  }

  Widget _textFieldOTP(
      {bool? first,
      last,
      TextEditingController? controller,
      required int position}) {
    return SizedBox(
      height: 70,
      width: 70,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: widget.invalidCode ? Color(0xFF79EFFF) : Color(0xFFAEC8FC),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Center(
          child: TextField(
            controller: controller,
            autofocus: true,
            onChanged: (value) {
              codes[position] = value;
              if (codes[0].isNotEmpty &&
                  codes[1].isNotEmpty &&
                  codes[2].isNotEmpty &&
                  codes[3].isNotEmpty) {
                widget.onPinEntered(
                    "${codes[0]}${codes[1]}${codes[2]}${codes[3]}");
              } else {
                widget.onPinEntered("");
              }
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

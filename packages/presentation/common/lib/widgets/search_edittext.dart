import 'dart:async';

import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchEdittext extends StatefulWidget {
  Function(String productName) onTextChange;

  SearchEdittext({super.key, required this.onTextChange});

  @override
  State<SearchEdittext> createState() => _SearchEdittextState();
}

class Debouncer {
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class _SearchEdittextState extends State<SearchEdittext> {
  bool hasRemoveButton = false;
  TextEditingController controller = TextEditingController();
  final _debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FocusScope(
            child: Focus(
              onFocusChange: (focus) {
                setState(() {
                  hasRemoveButton = focus;
                });
              },
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.text,
                style: Theme.of(context).textTheme.labelMedium,
                onChanged: (value) {
                  _debouncer.run(() {
                    widget.onTextChange(value);
                  });
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    left: 12,
                    top: 0,
                    bottom: 0,
                    right: 12,
                  ),
                  hintText: context.translations.car_model,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Theme.of(context)
                        .colorScheme
                        .secondary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFC0D8FF),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFC0D8FF),
                    ),
                  ),
                  prefixIcon: Container(
                    height: 24,
                    width: 24,
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      PathImages.search,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: hasRemoveButton,
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                    hasRemoveButton = false;
                    controller.clear();
                  });
                  widget.onTextChange("");
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: const Icon(
                    Icons.close,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              // shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFC0D8FF),
              ),
            ),
            child: SvgPicture.asset(
              PathImages.filter,
            ))
      ],
    );
  }
}

import 'dart:io';

import 'package:common/extension.dart';
import 'package:flutter/material.dart';

class CarImageSelectorLocalWidget extends StatefulWidget {
  const CarImageSelectorLocalWidget({super.key, required this.images});

  final List<String> images;

  @override
  State<CarImageSelectorLocalWidget> createState() =>
      _CarImageSelectorLocalWidgetState();
}

class _CarImageSelectorLocalWidgetState
    extends State<CarImageSelectorLocalWidget> {
  int position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SizedBox(
              height: 200,
              child: Image.file(
                File(widget.images[position]),
                height: 200,
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          // height: 180,
          child: Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 8.0,
            children: widget.images.mapIndexed((image, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    position = index;
                  });
                },
                child: Container(
                  decoration: position == index
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.5,
                          ),
                        )
                      : null,
                  padding: const EdgeInsets.all(2),
                  width: MediaQuery.sizeOf(context).width / 3 - 32,
                  height: 64,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      File(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

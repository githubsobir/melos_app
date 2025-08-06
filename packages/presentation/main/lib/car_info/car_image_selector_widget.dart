import 'package:common/extension.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:main/booking/item_car_image.dart';

class CarImageSelectorWidget extends StatefulWidget {
  const CarImageSelectorWidget({super.key, required this.images});

  final List<String> images;

  @override
  State<CarImageSelectorWidget> createState() => _CarImageSelectorWidgetState();
}

class _CarImageSelectorWidgetState extends State<CarImageSelectorWidget> {
  int position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: ItemCarImage(
            width: MediaQuery.sizeOf(context).width,
            height: 200,
            imagePath: "$BASE_URL_IMAGE${widget.images[position]}",
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
                  child: ItemCarImage(
                    imagePath: "$BASE_URL_IMAGE$image",
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

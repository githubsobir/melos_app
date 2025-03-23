import 'dart:io';

import 'package:common/l10n/build_context_extension.dart';
import 'package:common/widgets/base_button.dart';
import 'package:domain/model/cars/car_create_model.dart';
import 'package:flutter/material.dart';
import 'package:main/booking/item_top_bottom.dart';
import 'package:main/car_info/car_image_selector_local_widget.dart';

class Page5 extends StatelessWidget {
  final CarCreateModel carModel;
  final VoidCallback onCreate;

  const Page5({
    super.key,
    required this.carModel,
    required this.onCreate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      color: Theme.of(context).colorScheme.brightness == Brightness.light
          ? const Color(0xFFF6F7F9)
          : const Color(0xFF061136),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              // elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CarImageSelectorLocalWidget(
                  images: carModel.photos ?? [],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      context.translations.car_detail,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ItemTopBottom(
                            leftText: "Модель",
                            rightText: "${carModel.model}",
                          ),
                        ),
                        Expanded(
                          child: ItemTopBottom(
                            leftText: "Пробег",
                            rightText: "${carModel.mileage}",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ItemTopBottom(
                            leftText: "Год",
                            rightText: "${carModel.year}",
                          ),
                        ),
                        Expanded(
                          child: ItemTopBottom(
                            leftText: "Госномер",
                            rightText: "${carModel.registrationNumber}",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Цена",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      "${carModel.dailyRate} сум",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: carModel.document != null,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Страхование и документы",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        width: 102,
                        height: 145,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            File(carModel.document ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            BaseButton(
              onPressed: onCreate,
              title: context.translations.save,
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

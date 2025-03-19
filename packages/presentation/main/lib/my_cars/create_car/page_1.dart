import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/textfield3.dart';
import 'package:domain/model/location/point_model.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/my_cars_intents.dart';

class Page1 extends StatefulWidget {
  final ValueChanged<String> onChangedMake;
  final ValueChanged<String> onChangedModel;
  final ValueChanged<String> onChangedRegNumber;
  final ValueChanged<String> onChangedCity;
  final ValueChanged<String> onChangedTransmission;
  final ValueChanged<String> onChangedPassengerCapacity;
  final Function(
    double latitude,
    double longitude,
  ) onChangedLocations;

  const Page1({
    super.key,
    required this.onChangedMake,
    required this.onChangedModel,
    required this.onChangedRegNumber,
    required this.onChangedCity,
    required this.onChangedTransmission,
    required this.onChangedPassengerCapacity,
    required this.onChangedLocations,
  });

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String location = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 16,
              ),
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: 24,
              ),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 55,
                        width: 55,
                        child: CircularProgressIndicator(
                          value: 0.25,
                          backgroundColor: const Color(0xFFD9D9D9),
                          color: Theme.of(context).colorScheme.primary,
                          strokeWidth: 8.0,
                        ),
                      ),
                      Text(
                        '1/4',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: const Color(0xFF658DF1)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Заполните данные ниже',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Марка',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: TextField3(
                    hint: "Шевроле",
                    onChanged: widget.onChangedMake,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Модель',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: TextField3(
                    hint: "Малибу 2 Турбо",
                    onChanged: widget.onChangedModel,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Госномер',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: TextField3(
                    hint: "01 | A 001 AA",
                    onChanged: widget.onChangedRegNumber,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Город',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: TextField3(
                    hint: "Ташкент",
                    onChanged: widget.onChangedCity,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Коробка передач',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: TextField3(
                    hint: "Автомат",
                    onChanged: widget.onChangedTransmission,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Вместимость пассажиров',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: TextField3(
                    hint: "2",
                    keyboardType: TextInputType.number,
                    onChanged: widget.onChangedPassengerCapacity,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            BaseButton(
              width: 170,
              onPressed: () {
                context.openScreen(SelectLocationScreenIntent()).then(
                  (value) {
                    if (value is PointModel) {
                      widget.onChangedLocations(
                          value.latitude, value.longitude);
                      setState(() {
                        location = "${value.latitude}, ${value.longitude}";
                      });
                    }
                  },
                );
              },
              title: "Локация",
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              location,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}

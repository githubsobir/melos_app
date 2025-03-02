import 'package:common/decorations.dart';
import 'package:flutter/material.dart';
import 'package:main/booking/item_car_image.dart';
import 'package:main/booking/item_top_bottom.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("История бронирования"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24,top: 16,bottom: 16),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: ItemCarImage(
                  width: double.infinity,
                  height: 180,
                  imagePath:
                  "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg"),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              // height: 180,
              child: Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 8.0,
                children: [
                  "",
                  "",
                  "",
                  "",
                  "",
                  "",
                ]
                    .map(
                      (e) =>  ItemCarImage(
                      width: MediaQuery.sizeOf(context).width/3-32,
                      height: 50,
                      imagePath:
                      "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg"),
                )
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Детали автомобиля",
                        style:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ItemTopBottom(
                        leftText: "Модель",
                        rightText: "Malibu 2 Turbo",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ItemTopBottom(
                        leftText: "Число",
                        rightText: "01/A123BC/UZ",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Подробности аренды",
                        style:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ItemTopBottom(
                        leftText: "Дата получения",
                        rightText: "12 нояб. 2024 г.",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ItemTopBottom(
                        leftText: "Дата возврата",
                        rightText: "13 нояб. 2024 г.",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            // second
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Реквизиты для оплаты",
                        style:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ItemTopBottom(
                        leftText: "Депозит",
                        rightText: "\$55.00",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ItemTopBottom(
                        leftText: "Оставшийся",
                        rightText: "\$44.00",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ItemTopBottom(
                        leftText: "Общая сумма оплаты",
                        rightText: "\$99.00",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Статус бронирования",
                        style:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            "Статус",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: Theme.of(context)
                        .colorScheme
                        .secondary),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            decoration: Decorations.basicDecoration(
                              background: const Color(0xFF16ED38),
                              radius: 4,
                            ),
                            padding: const EdgeInsets.only(
                              left: 6,
                              right: 6,
                            ),
                            child: Text(
                              "Завершенный",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: Decorations.basicDecoration(
                            background: Theme.of(context).colorScheme.primary,
                            radius: 4),
                        padding: const EdgeInsets.only(
                          left: 6,
                          right: 6,
                        ),
                        child: Text(
                          "Арендуйте этот автомобиль сейчас",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

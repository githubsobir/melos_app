import 'package:flutter/material.dart';
import 'package:main/booking/item_car_image.dart';
import 'package:main/booking/item_left_right.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Бронирование"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ItemCarImage(
                  imagePath:
                      "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg"),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ItemCarImage(
                        imagePath:
                            "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ItemCarImage(
                        imagePath:
                            "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ItemCarImage(
                        imagePath:
                            "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ItemCarImage(
                        imagePath:
                            "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ItemCarImage(
                        imagePath:
                            "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ItemCarImage(
                        imagePath:
                            "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg"),
                  ),
                ],
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ItemLeftRight(
                        leftText: "Модель",
                        rightText: "Malibu 2 Turbo",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ItemLeftRight(
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ItemLeftRight(
                        leftText: "Дата получения", rightText: "12 нояб. 2024 г.",),
                      SizedBox(
                        height: 12,
                      ),
                      ItemLeftRight(
                        leftText: "Дата возврата", rightText: "13 нояб. 2024 г.",),
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ItemLeftRight(
                        leftText: "Депозит", rightText: "\$55.00",),
                      SizedBox(
                        height: 12,
                      ),
                      ItemLeftRight(
                        leftText: "Оставшийся", rightText: "\$44.00",),
                      SizedBox(
                        height: 12,
                      ),
                      ItemLeftRight(
                        leftText: "Общая сумма оплаты", rightText: "\$99.00",),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Статус бронирования",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Статус",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: const Color(0xFF90A3BF)),
                      ),

                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

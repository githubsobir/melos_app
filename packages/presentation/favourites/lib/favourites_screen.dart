import 'package:common/items/item_car.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: ListView.builder(
          itemCount: 10,
          padding: const EdgeInsets.only(top: 16),
          itemBuilder: (context, index) {
            return ItemCarBase(
              carImage:
                  "https://www.hyundai.com/content/dam/hyundai/in/en/data/find-a-car/i20/Highlights/pc/i20_Modelpc.png",
              carName: "Chevrolet Captiva wd",
              carType: "SUVVVV",
              price: 89,
              fullPrice: 980,
              onPressed: () {},
              passengerCapacity: 100,
              fuelCapacity: 1900,
              onLike: () {},
              isLiked: true,
            );
          },
        ),
      ),
    );
  }
}

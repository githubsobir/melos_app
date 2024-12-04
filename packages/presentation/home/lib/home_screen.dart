import 'package:common/items/item_car.dart';
import 'package:common/items/item_car_popular.dart';
import 'package:common/search_edittext.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      body: ListView(
        children: [
          Card(
            elevation: 0,
            margin: const EdgeInsets.all(0),
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'CARbnb',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: const Color(0xFF54A6FF)),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SearchEdittext(
                    onTextChange: (productName) {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Рекомендация Автомобиль",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF90A3BF),
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  "Просмотреть все",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 280,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(right: 24),
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(left: 24),
                child: ItemCarPopular(
                  onPressed: () {},
                  carImage: "https://www.hyundai.com/content/dam/hyundai/in/en/data/find-a-car/i20/Highlights/pc/i20_Modelpc.png",
                  carName: "carName",
                  carType: "carType",
                  price: 100,
                  fullPrice: 300,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Рекомендация Автомобиль",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF90A3BF),
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          for (int i = 0; i < 10; i++)
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: ItemCarBase(
                carImage:
                    "https://www.hyundai.com/content/dam/hyundai/in/en/data/find-a-car/i20/Highlights/pc/i20_Modelpc.png",
                carName: "Chevrolet Captiva wd",
                carType: "SUVVVV",
                price: 89,
                fullPrice: 980,
                onPressed: () {},
              ),
            )
        ],
      ),
    );
  }
}

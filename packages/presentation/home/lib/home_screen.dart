import 'package:common/items/item_car.dart';
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
          Container(
            color: Colors.white,
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
          const SizedBox(
            height: 16,
          ),
          ItemCar(
            carName: "Chevrolet Captiva wd",
            carType: "SUVVVV",
            price: 89,
            fullPrice: 980,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

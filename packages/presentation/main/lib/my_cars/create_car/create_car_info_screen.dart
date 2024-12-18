import 'package:common/base_button.dart';
import 'package:flutter/material.dart';
import 'package:main/my_cars/create_car/page_1.dart';
import 'package:main/my_cars/create_car/page_2.dart';
import 'package:main/my_cars/create_car/page_3.dart';

class CreateCarInfoScreen extends StatelessWidget {
  const CreateCarInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои машины"),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              children: [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.primary)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 6, bottom: 6),
                      child: Text(
                        "Оставлять",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  ),
                ),
                BaseButton(onPressed: () {}, title: "Следующий")
              ],
            ),
          ),
          const SizedBox(
            height: 52,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:main/my_cars/item_my_car.dart';

class MyCarsScreen extends StatelessWidget {
  const MyCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои машины"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return const ItemMyCar(
              carImage:
                  "https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?cs=srgb&dl=pexels-pixabay-210019.jpg&fm=jpg");
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 4,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main/my_cars/my_cars/item_my_car.dart';
import 'package:main/my_cars/my_cars/my_cars_cubit.dart';

class MyCarsScreen extends StatelessWidget {
  MyCarsScreen({super.key});

  final MyCarsCubit cubit = MyCarsCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Мои машины"),
      ),
      body: BlocBuilder<MyCarsCubit, MyCarsState>(
        bloc: cubit,
        builder: (context, state) {
          return carList();
        },
      ),
    );
  }

  carList() {
    return ListView.builder(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 24,
      ),
      itemBuilder: (context, index) {
        return const ItemMyCar(
            carImage:
                "https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?cs=srgb&dl=pexels-pixabay-210019.jpg&fm=jpg");
      },
      itemCount: 4,
    );
  }
}

import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:main/my_cars/item_my_car.dart';
import 'package:main/my_cars/my_cars_cubit.dart';
import 'package:navigation/my_cars_intents.dart';

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
    return ListView.separated(
      itemBuilder: (context, index) {
        return const ItemMyCar(
            carImage:
                "https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?cs=srgb&dl=pexels-pixabay-210019.jpg&fm=jpg");
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: 4,
    );
  }
}

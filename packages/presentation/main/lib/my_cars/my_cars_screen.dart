import 'package:common/base_button.dart';
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
          if (state.cars.isEmpty) {
            return emptyCar(context);
          } else {
            return carList();
          }
        },
      ),
    );
  }

  emptyCar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Сдавайте автомобиль в аренду с легкостью!",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Получайте дополнительный доход, делясь своим автомобилем через нашу платформу! Просто предоставьте необходимые данные о вашем автомобиле, включая марку, модель, год, состояние, доступность и цену. Убедитесь, что ваш автомобиль оснащен устройством GPS для бесперебойного отслеживания и безопасности во время аренды.",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Что вам понадобится для начала:",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "1. Полные данные об автомобиле (марка, модель, год выпуска, номерной знак и т. д.)."
            "\n2. Фотографии вашего автомобиля (внутри и снаружи)."
            "\n3. Подтверждение страховки и регистрации."
            "\n4. Устройство GPS-слежения, установленное в вашем автомобиле."
            "\n5. Безопасность вашего автомобиля и ваше спокойствие — наши главные приоритеты!",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: 24,
          ),
          BaseButton(
              onPressed: () async {
                var value = await context.openScreen(CreateCarInfoIntent());
                if (value) {
                  cubit.getMyCars();
                }
              },
              title: "Начать")
        ],
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

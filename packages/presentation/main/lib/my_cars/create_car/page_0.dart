import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';

class Page0 extends StatelessWidget {
  const Page0({super.key, required this.onStart});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      // height: double.infinity,
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
          BaseButton(onPressed: onStart, title: "Начать")
        ],
      ),
    );
  }
}

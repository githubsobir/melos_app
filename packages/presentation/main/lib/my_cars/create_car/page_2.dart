import 'package:common/path_images.dart';
import 'package:common/widgets/textfield3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: double.infinity,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 16,
            ),
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
              bottom: 24,
            ),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: CircularProgressIndicator(
                        value: 0.50,
                        backgroundColor: Color(0xFFD9D9D9),
                        color: Theme.of(context).colorScheme.primary,
                        strokeWidth: 8.0,
                      ),
                    ),
                    Text(
                      '2/4',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: const Color(0xFF658DF1)),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Состояние транспортного средства',
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: const Color(0xFF658DF1)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Год выпуска",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              SizedBox(width: 170, child: TextField3(hint: "2025"))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Пробег",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              SizedBox(width: 170, child: TextField3(hint: "12 000 км"))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Объем топливного бака",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              const SizedBox(width: 170, child: TextField3(hint: "4"))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Загрузите фото автомобиля",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Поддерживаемые форматы: JPEG, PNG, PDG (до 10 МБ)",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(color: const Color(0xffA9ACB4)),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(PathImages.upload),
              ),
              Expanded(child: Container())
            ],
          )
        ],
      ),
    );
  }
}

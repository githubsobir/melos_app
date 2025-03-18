import 'package:common/path_images.dart';
import 'package:common/widgets/textfield3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page4 extends StatelessWidget {
  Page4({super.key});

  final List<String> radioButtons = [
    "yes",
    "no",
  ];
  String selectedRadio = "yes";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: SingleChildScrollView(
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
                          value: 1.0,
                          backgroundColor: Color(0xFFD9D9D9),
                          color: Theme.of(context).colorScheme.primary,
                          strokeWidth: 8.0,
                        ),
                      ),
                      Text(
                        '4/4',
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
                          "Страхование и документы",
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
            Row(
              children: [
                SvgPicture.asset(PathImages.lampOn),
                Expanded(
                  child: Text(
                    "Для сдачи автомобиля в аренду необходима установка GPS!",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "GPS-данные",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Порт",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(width: 170, child: TextField3(hint: "21073"))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Уникальный ID",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(
                    width: 170, child: TextField3(hint: "357454075150068"))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "У вас есть страховка автомобиля?",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    value: selectedRadio,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(
                      "Да",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    groupValue: radioButtons[0],
                    onChanged: (value) {},
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(
                      "Нет",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    value: selectedRadio,
                    groupValue: radioButtons[1],
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Загрузить подтверждение регистрации",
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
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: const Color(0xffA9ACB4)),
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
      ),
    );
  }
}

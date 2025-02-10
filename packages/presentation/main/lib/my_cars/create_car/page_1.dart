import 'package:common/widgets/textfield3.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      // height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                          value: 0.25,
                          backgroundColor: Color(0xFFD9D9D9),
                          color: Theme.of(context).colorScheme.primary,
                          strokeWidth: 8.0,
                        ),
                      ),
                      Text(
                        '1/4',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: const Color(0xFF658DF1)),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Детали автомобиля',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: const Color(0xFF658DF1)),
                      ),
                      Text(
                        'Заполните данные ниже',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: const Color(0xFF90A3BF)),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Делать', style: Theme.of(context).textTheme.labelMedium),
                SizedBox(
                    width: 150,
                    child: TextField3(
                      hint: "Шевроле",
                    ))
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Модель', style: Theme.of(context).textTheme.labelMedium),
                SizedBox(
                    width: 150,
                    child: TextField3(
                      hint: "Малибу 2 Турбо",
                    ))
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Год выпуска',
                    style: Theme.of(context).textTheme.labelMedium),
                SizedBox(
                    width: 150,
                    child: TextField3(
                      hint: "2020",
                    ))
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ЛПН', style: Theme.of(context).textTheme.labelMedium),
                SizedBox(
                    width: 150,
                    child: TextField3(
                      hint: "01/A123BC/UZ",
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

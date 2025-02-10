import 'package:common/path_images.dart';
import 'package:common/widgets/textfield3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page3 extends StatelessWidget {
  Page3({super.key});

  final List<String> radioButtons = [
    "better",
    "coll",
  ];
  String selectedRadio = "better";

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
                        value: 0.75,
                        backgroundColor: Color(0xFFD9D9D9),
                        color: Theme.of(context).colorScheme.primary,
                        strokeWidth: 8.0,
                      ),
                    ),
                    Text(
                      '3/4',
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
                        "Оплата и цены",
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: const Color(0xFF658DF1)),
                      ),
                      Text(
                        'Заполните данные ниже',
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: const Color(0xFF90A3BF)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Text(
            "Оплата и цены",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SvgPicture.asset(PathImages.lampOn),
              Expanded(
                child: Text(
                  "Введите цену аренды вашего автомобиля! Учтите, что к этой цене будут добавлены 1% за обслуживание и государственные налоги.",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: const Color(0xFF90A3BF)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Цена",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(width: 120, child: TextField3(hint: "80 000"))
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Опишите состояние транспортного средства, выбрав:",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  value: selectedRadio,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    "В час",
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
                    "В день",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  value: selectedRadio,
                  groupValue: radioButtons[1],
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

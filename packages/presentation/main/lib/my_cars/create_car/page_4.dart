import 'package:common/decorations.dart';
import 'package:common/path_images.dart';
import 'package:common/textfield3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page4 extends StatelessWidget {
  Page4({super.key});

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
                      Text(
                        'Fill in the details below',
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
            "Вы установили GPS?",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SvgPicture.asset(PathImages.lampOn),
              Expanded(
                child: Text(
                  "GPS installation is required to rent out your car!",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: const Color(0xFF90A3BF)),
                ),
              ),
            ],
          ),
          const SizedBox(
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
          SizedBox(height: 16,),
          Text(
            "У вас есть страховка автомобиля?",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SvgPicture.asset(PathImages.lampOn),
              Expanded(
                child: Text(
                  "Для сдачи автомобиля в аренду необходима установка GPS!",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: const Color(0xFF90A3BF)),
                ),
              ),
            ],
          ),
          const SizedBox(
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
          SizedBox(height: 16,),
          Text(
            "Загрузить подтверждение регистрации",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SvgPicture.asset(PathImages.lampOn),
              Expanded(
                child: Text(
                  "Для сдачи автомобиля в аренду требуется подтверждение регистрации!",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: const Color(0xFF90A3BF)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: Decorations.basicDecoration(
                    background: const Color(0xFFD9D9D9),
                    radius: 8,
                  ),
                  padding: const EdgeInsets.only(
                    left: 26,
                    right: 26,
                    top: 43,
                    bottom: 43,
                  ),
                  child: SvgPicture.asset(PathImages.upload),
                ),
              ),
              Expanded(child: Container())
            ],
          )
        ],
      ),
    );
  }
}

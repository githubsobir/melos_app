import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intent_launcher/intent_launcher.dart';

class WithdrawingMoneyScreen extends StatelessWidget {
  const WithdrawingMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Снятие денег"),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          bottom: 24.0,
        ),
        child: BaseButton(
          onPressed: () {
            context.closeActiveScreen();
          },
          title: "Оставлять заявку",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        color: Theme.of(context).colorScheme.primary,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 24.0,
                          top: 12.0,
                          bottom: 12.0,
                          right: 24.0,
                        ),
                        child: SvgPicture.asset(PathImages.moneyIcon),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 36),
                        child: Text(
                          "12 590 000 sum",
                          textAlign: TextAlign.end,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: const Color(0xff3563E9),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const BaseTextField(
                title: "Введите сумму",
                type: TextFieldType.NUMBER,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                  "Инструкция для снятия средств \n 1. Ваша заявка на снятие средств была отправлена в администрацию. В течение 3 рабочих дней с вами свяжется наш специалист для уточнения деталей.\n 2. В течение 15 рабочих дней средства будут переведены на ваш счет.\n 3.Вы можете отслеживать статус своей заявки и подтверждение на странице \"Мой профиль\" или проверить информацию на странице \"Счёт\" "),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

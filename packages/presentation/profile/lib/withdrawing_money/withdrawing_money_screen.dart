import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/base_loader_builder.dart';
import 'package:common/widgets/base_text_field.dart';
import 'package:common/widgets/custom_functions.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:profile/withdrawing_money/withdrawing_money_cubit.dart';

class WithdrawingMoneyScreen extends StatelessWidget {
  WithdrawingMoneyScreen({super.key});

  final cubit = WithdrawingMoneyCubit(inject())..balance();
  String amount = "0";
  TextEditingController controller = TextEditingController();

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
            if (controller.text.isNotEmpty) {
              cubit.withdraw(amount: controller.text);
            } else {
              showToast("Введите сумму");
            }
          },
          title: "Оставлять заявку",
        ),
      ),
      body: BlocConsumer<WithdrawingMoneyCubit, WithdrawingMoneyState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is WithdrawMoneyState) {
            context.closeActiveScreen();
            showToast("Заявка подана");
          }else if (state is WithdrawMoneyErrorState) {
            showToast(state.message);
          }
        },
        listenWhen: (previous, current) => current is WithdrawMoneyState || current is WithdrawMoneyErrorState,
        buildWhen: (previous, current) => current is BalanceState || current is LoaderState,
        builder: (context, state) {
          if (state is BalanceState) {
            amount = state.balance.balance ?? "";
          }
          return BaseLoaderBuilder(
            hasLoading: state is LoaderState,
            child: Padding(
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
                                "$amount ${context.translations.sum}",
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
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
                    BaseTextField(
                      controller: controller,
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
        },
      ),
    );
  }
}

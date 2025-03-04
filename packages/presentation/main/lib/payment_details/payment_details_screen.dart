import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/decorations.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/textfield2.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main/payment_details/payment/payment_bottom_sheet.dart';
import 'package:main/payment_details/payment_detail_cubit.dart';

class PaymentDetailsScreen extends StatelessWidget {
  PaymentDetailsScreen({super.key});

  final PaymentDetailCubit cubit = PaymentDetailCubit(inject());
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      appBar: AppBar(
        title: const Text("Оплата"),
        backgroundColor:
            Theme.of(context).colorScheme.brightness == Brightness.light
                ? const Color(0xFFF6F7F9)
                : const Color(0xFF061136),
      ),
      body: BlocBuilder<PaymentDetailCubit, PaymentDetailState>(
        bloc: cubit,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Резюме аренды",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                              SvgPicture.asset(
                                PathImages.share,
                                height: 24,
                                width: 24,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              true
                                  ? SvgPicture.asset(
                                      PathImages.favouriteOn,
                                      height: 24,
                                      width: 24,
                                    )
                                  : SvgPicture.asset(
                                      PathImages.favouriteOff,
                                      height: 24,
                                      width: 24,
                                    ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg",
                                    width: 116,
                                    height: 80,
                                    fit: BoxFit.fill,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            SizedBox(
                                      width: 116,
                                      height: 80,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                strokeWidth: 1,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Малибу Турбо ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, bottom: 4),
                                      child: RatingBar.builder(
                                        initialRating: 4,
                                        minRating: 1,
                                        itemCount: 5,
                                        itemSize: 18,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ),
                                    Text(
                                      "440+ рецензентов",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 24, bottom: 16),
                            child: Divider(),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Срок аренды",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                ),
                              ),
                              Text(
                                "6",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Стоимость за день",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                ),
                              ),
                              Text(
                                "99 000 сум",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Залог",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                ),
                              ),
                              Text(
                                "9 000 сум",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Общая стоимость аренды",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                              Text(
                                "108 900 сум",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // Card(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(16.0),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.stretch,
                  //       children: [
                  //         Text(
                  //           "Платежная информация",
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .bodyMedium
                  //               ?.copyWith(fontWeight: FontWeight.w700),
                  //         ),
                  //         SizedBox(
                  //           height: 4,
                  //         ),
                  //         Text(
                  //           "Пожалуйста, введите ваши платежные данные",
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .labelMedium
                  //               ?.copyWith(
                  //                   color: Theme.of(context).colorScheme.secondary),
                  //         ),
                  //         SizedBox(
                  //           height: 16,
                  //         ),
                  //         TextField2(
                  //           title: "Имя",
                  //           hint: "Ваше имя",
                  //         ),
                  //         SizedBox(
                  //           height: 16,
                  //         ),
                  //         TextField2(
                  //           title: "Адрес",
                  //           hint: "Адрес",
                  //         ),
                  //         SizedBox(
                  //           height: 16,
                  //         ),
                  //         TextField2(
                  //           title: "Номер телефона",
                  //           hint: "Номер телефона",
                  //         ),
                  //         SizedBox(
                  //           height: 16,
                  //         ),
                  //         TextField2(
                  //           title: "Город / Город",
                  //           hint: "Город или местечко",
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 24,
                  // ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Способ оплаты",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Пожалуйста, введите способ оплаты",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              cubit.selectPaymentMethod(0);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color:
                                    Theme.of(context).colorScheme.brightness ==
                                            Brightness.light
                                        ? const Color(0xFFF6F7F9)
                                        : const Color(0xFF061136),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: Radio(
                                          value: cubit.state.selectedMethod,
                                          visualDensity: const VisualDensity(
                                              horizontal:
                                                  VisualDensity.minimumDensity,
                                              vertical:
                                                  VisualDensity.minimumDensity),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          groupValue:
                                              cubit.state.paymentMethods[0],
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Банковская карта",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Image.asset(
                                        PathImages.humoUzcard,
                                        width: 78,
                                        height: 20,
                                      )
                                    ],
                                  ),
                                  TextField2(
                                    title: "Номер карты",
                                    hint: "Номер карты",
                                    fillColor: Colors.white,
                                    controller: cardNumberController
                                      ..addListener(
                                        () {
                                          cubit.setCardNumber(
                                            cardNumberController.text,
                                          );
                                        },
                                      ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  TextField2(
                                    title: "Дата окончания срока",
                                    hint: "ММ / ГГ",
                                    fillColor: Colors.white,
                                    controller: cardDateController
                                      ..addListener(
                                        () {
                                          cubit.setCardDate(
                                            cardDateController.text,
                                          );
                                        },
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              cubit.selectPaymentMethod(1);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color:
                                    Theme.of(context).colorScheme.brightness ==
                                            Brightness.light
                                        ? const Color(0xFFF6F7F9)
                                        : const Color(0xFF061136),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: Radio(
                                      value: cubit.state.selectedMethod,
                                      visualDensity: const VisualDensity(
                                          horizontal:
                                              VisualDensity.minimumDensity,
                                          vertical:
                                              VisualDensity.minimumDensity),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      groupValue: cubit.state.paymentMethods[1],
                                      onChanged: (value) {},
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Payme",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Image.asset(
                                    PathImages.payme,
                                    width: 78,
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              cubit.selectPaymentMethod(2);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color:
                                    Theme.of(context).colorScheme.brightness ==
                                            Brightness.light
                                        ? const Color(0xFFF6F7F9)
                                        : const Color(0xFF061136),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: Radio(
                                      value: cubit.state.selectedMethod,
                                      visualDensity: const VisualDensity(
                                          horizontal:
                                              VisualDensity.minimumDensity,
                                          vertical:
                                              VisualDensity.minimumDensity),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      groupValue: cubit.state.paymentMethods[2],
                                      onChanged: (value) {},
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Click",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Image.asset(
                                    PathImages.click,
                                    width: 78,
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Подтверждение",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Мы приближаемся к концу. Всего несколько кликов и ваша аренда готова!",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            decoration: Decorations.basicDecoration(
                              radius: 10,
                              background:
                                  Theme.of(context).colorScheme.brightness ==
                                          Brightness.light
                                      ? const Color(0xFFF6F7F9)
                                      : const Color(0xFF061136),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: Checkbox(
                                    value: cubit.state.firstAgreement,
                                    checkColor: Colors.white,
                                    onChanged: (value) {
                                      cubit.setFirstAgreement((value ?? false));
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Text(
                                    "Я согласен на отправку СМС-уведомлений.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: Decorations.basicDecoration(
                              radius: 10,
                              background:
                                  Theme.of(context).colorScheme.brightness ==
                                          Brightness.light
                                      ? const Color(0xFFF6F7F9)
                                      : const Color(0xFF061136),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: Checkbox(
                                    value: cubit.state.secondAgreement,
                                    checkColor: Colors.white,
                                    onChanged: (value) {
                                      cubit
                                          .setSecondAgreement((value ?? false));
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Text(
                                    "Я согласен с нашими условиями и политикой конфиденциальности!",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                ),
                                child: SvgPicture.asset(
                                  PathImages.securitySafety,
                                  // height: 24,
                                  // width: 24,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Все ваши данные в безопасности",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Мы используем самые передовые средства безопасности, чтобы обеспечить вам наилучшие впечатления.",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          BaseButton(
                              onPressed: (cubit.state.firstAgreement &&
                                      cubit.state.secondAgreement &&
                                      ((cubit.state.selectedMethod == 0 &&
                                              cubit.state.cardNumber
                                                  .isNotEmpty &&
                                              cubit
                                                  .state.cardDate.isNotEmpty) ||
                                          cubit.state.selectedMethod == 1 ||
                                          cubit.state.selectedMethod == 2))
                                  ? () {
                                      PaymentBottomSheet.show(context: context);
                                    }
                                  : null,
                              title: "Арендовать сейчас"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

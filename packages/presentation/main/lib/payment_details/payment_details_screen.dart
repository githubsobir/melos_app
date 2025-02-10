import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/decorations.dart';
import 'package:common/widgets/textfield2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      appBar: AppBar(
        title: Text("Payment"),
        backgroundColor:
            Theme.of(context).colorScheme.brightness == Brightness.light
                ? const Color(0xFFF6F7F9)
                : const Color(0xFF061136),
      ),
      body: SingleChildScrollView(
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
                      Text(
                        "Резюме аренды",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Цены могут меняться в зависимости от длительности аренды и стоимости арендованного вами автомобиля.",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                      ),
                      SizedBox(
                        height: 24,
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
                                            value: downloadProgress.progress,
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
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Резюме аренды",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 12, bottom: 4),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 16),
                        child: Divider(),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Промежуточный итог",
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
                            "\$80.00",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Налог",
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
                            "\$8",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Общая стоимость\nаренды",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          Text(
                            "\$88.00",
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
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Платежная информация",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Пожалуйста, введите ваши платежные данные",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField2(
                        title: "Имя",
                        hint: "Ваше имя",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField2(
                        title: "Адрес",
                        hint: "Адрес",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField2(
                        title: "Номер телефона",
                        hint: "Номер телефона",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField2(
                        title: "Город / Город",
                        hint: "Город или местечко",
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
                        "Способ оплаты",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Пожалуйста, введите способ оплаты",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField2(
                        title: "Номер карты",
                        hint: "Номер карты",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField2(
                        title: "Дата окончания срока",
                        hint: "ММ / ГГ",
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
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Мы приближаемся к концу. Всего несколько кликов и ваша аренда готова!",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                      ),
                      SizedBox(
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
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 24.0,
                                height: 24.0,
                                child: Checkbox(
                                    value: false, onChanged: (value) {})),
                            SizedBox(
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
                                        )))
                          ],
                        ),
                      ),
                      SizedBox(
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
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 24.0,
                                height: 24.0,
                                child: Checkbox(
                                    value: false, onChanged: (value) {})),
                            SizedBox(
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
                                    )))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      BaseButton(onPressed: null, title: "Арендовать сейчас"),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Подтверждение",
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
                            color: Theme.of(context).colorScheme.secondary),
                      ),
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
      ),
    );
  }
}

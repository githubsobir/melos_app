import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main/car_info/car_image_selector_widget.dart';

class ReceivingTheCarScreen extends StatelessWidget {
  const ReceivingTheCarScreen({super.key, required this.bookingId});

  final num bookingId;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor:
            Theme.of(context).colorScheme.brightness == Brightness.light
                ? const Color(0xFFF6F7F9)
                : const Color(0xFF061136),
        appBar: AppBar(
          title: const Text("Получение автомобиля"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Card(
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CarImageSelectorWidget(
                      images: [
                        "/backend/media/car_photos/db/cars_image/photo141.jpg",
                        "/backend/media/car_photos/db/cars_image/photo158.jpg",
                        "/backend/media/car_photos/db/cars_image/photo158.jpg",
                        "/backend/media/car_photos/db/cars_image/photo78.jpg",
                        "/backend/media/car_photos/db/cars_image/photo78.jpg",
                        "/backend/media/car_photos/db/cars_image/photo257.jpg"
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Отчет",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
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
                              "3",
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
                              "10300 сум",
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
                              "23000 сум",
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
                                "Общая сумма аренды",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                            Text(
                              "100500 сум",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Владелец автомобиля",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              PathImages.nearbyCircled,
                              height: 44,
                              width: 44,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Azizbek Karimov",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              PathImages.phoneCircled,
                              height: 44,
                              width: 44,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "+998 93 935 0321",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              PathImages.nearbyCircledGrey,
                              height: 44,
                              width: 44,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Tashkent, Shaykhontohur, Qoratosh 33A",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      decoration: TextDecoration.underline,
                                      color: const Color(0xff0404B9)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Загрузите файл доверенности",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: Text(
                            "Поддерживаемые форматы: JPEG, PNG, PDG (до 10 МБ)",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: const Color(0xffA9ACB4)),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        SvgPicture.asset(
                          PathImages.uploadImage,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 190,
                  child: BaseButton(onPressed: () {}, title: "Отправить"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

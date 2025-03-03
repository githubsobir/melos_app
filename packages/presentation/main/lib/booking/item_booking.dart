import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/decorations.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:main/booking/item_top_bottom.dart';
import 'package:main/car_info/car_image_selector_widget.dart';

class ItemBooking extends StatelessWidget {
  const ItemBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      child: Column(
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.only(
                top: 16,
                bottom: 16,
              ),
              child: CarImageSelectorWidget(
                images: [
                  "/backend/media/car_photos/db/cars_image/photo141.jpg",
                  "/backend/media/car_photos/db/cars_image/photo216.jpg",
                  "/backend/media/car_photos/db/cars_image/photo141.jpg",
                  "/backend/media/car_photos/db/cars_image/photo141.jpg",
                  "/backend/media/car_photos/db/cars_image/photo141.jpg",
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.translations.car_detail,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            ItemTopBottom(
                              leftText: context.translations.model,
                              rightText: "Malibu 2 Turbo",
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ItemTopBottom(
                              leftText: "Гос. номер",
                              rightText: "01/A123BC/UZ",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Владелец",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "$BASE_URL_IMAGE/backend/media/car_photos/db/cars_image/photo73_kvkGvlK.jpg",
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            SizedBox(
                                      width: 24,
                                      height: 24,
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
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Azizbek Karimov",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(PathImages.phoneCircled),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "+998 93 935 0321",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Отчеты",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ItemTopBottom(
                    leftText: "Стоимость за день",
                    rightText: "99 000 сум",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ItemTopBottom(
                    leftText: "Залог",
                    rightText: "9900 сум",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ItemTopBottom(
                    leftText: "Итоговая стоимость",
                    rightText: "109 990 сум",
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Подробности аренды",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ItemTopBottom(
                    leftText: "Дата получения",
                    rightText: "12 нояб. 2025 г.",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ItemTopBottom(
                    leftText: "Число",
                    rightText: "18 нояб. 2025 г.",
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Статус бронирования",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        context.translations.status,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                      ),
                      SizedBox(
                        width: 48,
                      ),
                      Container(
                        decoration: Decorations.basicDecoration(
                          background: const Color(0xFF16ED38),
                          radius: 4,
                        ),
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Text(
                          context.translations.completed,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

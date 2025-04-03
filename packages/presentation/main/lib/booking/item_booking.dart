import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/decorations.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:main/booking/item_top_bottom.dart';
import 'package:main/car_info/car_image_selector_widget.dart';

class ItemBooking extends StatelessWidget {
  final List<String> images;
  final String carName;
  final String registrationNumber;
  final String dailyRate;
  final String securityDeposit;
  final String totalAmount;
  final String status;
  final String startDate;
  final String endDate;
  final String ownerPhoneNumber;
  final String profilePage;
  final String carOwner;
  final bool isPending;
  final VoidCallback finishBooking;

  const ItemBooking({
    super.key,
    required this.images,
    required this.carName,
    required this.registrationNumber,
    required this.dailyRate,
    required this.securityDeposit,
    required this.totalAmount,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.ownerPhoneNumber,
    required this.profilePage,
    required this.carOwner,
    required this.isPending,
    required this.finishBooking,
  });

  // return NumberFormat("#,##0", "ru").format(price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
              ),
              child: CarImageSelectorWidget(
                images: images,
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
                              rightText: carName,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ItemTopBottom(
                              leftText: "Гос. номер",
                              rightText: registrationNumber,
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
                                    imageUrl: "$BASE_URL_IMAGE$profilePage",
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
                                  carOwner,
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
                                  ownerPhoneNumber,
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
                    rightText: "$dailyRate сум",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ItemTopBottom(
                    leftText: "Залог",
                    rightText: "$securityDeposit сум",
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ItemTopBottom(
                    leftText: "Итоговая стоимость",
                    rightText: "$totalAmount сум",
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
                  Row(
                    children: [
                      Expanded(
                        child: ItemTopBottom(
                          leftText: "Дата получения",
                          // rightText: DateFormats.dateFormat(startDate, context),
                          rightText: startDate,
                        ),
                      ),
                      Expanded(
                        child: ItemTopBottom(
                          leftText: "Дата возврата",
                          // rightText: DateFormats.dateFormat(endDate, context),
                          rightText: endDate,
                        ),
                      ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.translations.status,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      isPending
                          ? Container(
                              decoration: Decorations.basicDecoration(
                                background: const Color(0xffFFAA17),
                                radius: 4,
                              ),
                              padding: const EdgeInsets.only(
                                left: 24,
                                right: 24,
                                top: 8,
                                bottom: 8,
                              ),
                              child: Text(
                                "В ходе выполнения",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                            )
                          : Container(
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
          BaseButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust radius as needed
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Вы уверены, что хотите изменить статус машину ?',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: BaseButton(
                                  onPressed: () {
                                    context.closeActiveScreen();
                                  },
                                  title: "Нет"),
                            ),
                            const SizedBox(
                              width: 48,
                            ),
                            Expanded(
                                child: BaseButton(
                              onPressed: () {
                                finishBooking();
                                context.closeActiveScreen();
                              },
                              title: "Да",
                              background: const Color(0xFFFF3636),
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              title: "Завершить")
        ],
      ),
    );
  }
}

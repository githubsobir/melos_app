import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/date_formats.dart';
import 'package:common/decorations.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:main/booking/item_top_bottom.dart';
import 'package:main/car_info/car_image_selector_widget.dart';

class ItemCurrentBooking extends StatelessWidget {
  final List<String> images;
  final String dailyRate;
  final String securityDeposit;
  final String totalAmount;
  final String status;
  final String startDate;
  final String endDate;

  const ItemCurrentBooking({
    super.key,
    required this.images,
    required this.dailyRate,
    required this.securityDeposit,
    required this.totalAmount,
    required this.status,
    required this.startDate,
    required this.endDate,
  });

  // return NumberFormat("#,##0", "ru").format(price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      child: Column(
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
                          rightText: DateFormats.dateFormat(startDate, context),
                        ),
                      ),
                      Expanded(
                        child: ItemTopBottom(
                          leftText: "Дата возврата",
                          rightText: DateFormats.dateFormat(endDate, context),
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

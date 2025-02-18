import 'package:common/decorations.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:main/booking/item_car_image.dart';
import 'package:main/booking/item_left_right.dart';

class ItemBooking extends StatelessWidget {
  const ItemBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24,top: 16,bottom: 16),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: ItemCarImage(
                width: double.infinity,
                height: 180,
                imagePath:
                "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg"),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            // height: 180,
            child: Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 8.0,
              children: [
                "",
                "",
                "",
                "",
                "",
                "",
              ]
                  .map(
                    (e) =>  ItemCarImage(
                    width: MediaQuery.sizeOf(context).width/3-32,
                    height: 50,
                    imagePath:
                    "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mikebirdy-170811.jpg&fm=jpg"),
              )
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.translations.car_detail,
                      style:
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ItemLeftRight(
                      leftText: context.translations.model,
                      rightText: "Malibu 2 Turbo",
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ItemLeftRight(
                      leftText: context.translations.number,
                      rightText: "01/A123BC/UZ",
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      context.translations.rental_details,
                      style:
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ItemLeftRight(
                      leftText: context.translations.date_of_receipt,
                      rightText: "12 нояб. 2024 г.",
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ItemLeftRight(
                      leftText: context.translations.return_date,
                      rightText: "13 нояб. 2024 г.",
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          // second
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      context.translations.payment_details,
                      style:
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ItemLeftRight(
                      leftText: context.translations.deposit,
                      rightText: "80 000 сум/день",
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ItemLeftRight(
                      leftText: context.translations.the_remaining,
                      rightText: "\$44.00",
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ItemLeftRight(
                      leftText: context.translations.total_payment_amount,
                      rightText: "\$99.00",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.translations.booking_status,
                      style:
                      Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                              ?.copyWith(color: Theme.of(context)
                        .colorScheme
                        .secondary),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          decoration: Decorations.basicDecoration(
                            background: const Color(0xFF16ED38),
                            radius: 4,
                          ),
                          padding: const EdgeInsets.only(
                            left: 6,
                            right: 6,
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
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: Decorations.basicDecoration(
                          background: Theme.of(context).colorScheme.primary,
                          radius: 4),
                      padding: const EdgeInsets.only(
                        left: 6,
                        right: 6,
                      ),
                      child: Text(
                        context.translations.extend_booking_time,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/path_images.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main/my_cars/my_cars/item_top_bottom_center.dart';

class ItemCurrentBookingCar extends StatefulWidget {
  const ItemCurrentBookingCar({
    super.key,
    required this.carImage,
    required this.onConfirmBooking,
    required this.onComplete,
    required this.carStatus,
  });

  final String carImage;
  final String carStatus;
  final VoidCallback onConfirmBooking;
  final VoidCallback onComplete;

  @override
  State<ItemCurrentBookingCar> createState() => _ItemCurrentBookingCarState();
}

class _ItemCurrentBookingCarState extends State<ItemCurrentBookingCar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: CachedNetworkImage(
              height: 150,
              width: double.infinity,
              imageUrl: widget.carImage,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
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
                          value: downloadProgress.progress,
                          color: Theme.of(context).colorScheme.primary,
                          strokeWidth: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Chevrolet Captiva",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
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
                                (context, url, downloadProgress) => SizedBox(
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
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Azizbek Karimov",
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      children: [
                        SvgPicture.asset(PathImages.phoneCircled),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "+998 93 935 0321",
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                //////
                const Row(
                  children: [
                    Expanded(
                      child: ItemTopBottomCenter(
                        leftText: "Дата получения",
                        rightText: "12 нояб. 2024 г.",
                      ),
                    ),
                    Expanded(
                      child: ItemTopBottomCenter(
                        leftText: "Дата возврата",
                        rightText: "12 нояб. 2024 г.",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          status(widget.carStatus),
        ],
      ),
    );
  }

  status(String status) {
    switch (status) {
      case "pending":
        return GestureDetector(
          onTap: widget.onConfirmBooking,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              color: Theme.of(context).colorScheme.primary,
            ),
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Text(
                "Подтвердить бронь",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        );
      case "confirmed":
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              color: Theme.of(context).colorScheme.secondary,
            ),
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Text(
                "Автомобиль в аренде",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        );
      case "completed":
        return GestureDetector(
          onTap: widget.onComplete,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              color: Theme.of(context).colorScheme.primary,
            ),
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Text(
                "Принять машину",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        );
      default:
        return Container();
    }
  }

  leftRight({
    required String title,
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 4),
          Text(
            title,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}

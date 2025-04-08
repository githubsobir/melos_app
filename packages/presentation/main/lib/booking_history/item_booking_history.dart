import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemBookingHistory extends StatelessWidget {
  const ItemBookingHistory({
    super.key,
    required this.carImage,
    required this.carName,
    required this.fromDate,
    required this.toDate,
  });

  final String carImage;
  final String carName;
  final String fromDate;
  final String toDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48,
                width: 78,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    height: 48,
                    width: 78,
                    imageUrl: "$BASE_URL_IMAGE$carImage",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => SizedBox(
                      height: 48,
                      width: 78,
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
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      carName,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Подобрать:",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                fromDate,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Высадка:",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                toDate,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider()
      ],
    );
  }
}

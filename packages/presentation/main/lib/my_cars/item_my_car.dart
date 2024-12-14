import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemMyCar extends StatelessWidget {
  const ItemMyCar({super.key, required this.carImage});

  final String carImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
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
                          imageUrl: carImage,
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
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Малибу 2 Турбо",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Цена за час:",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "90 416 UZS",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Малибу 2 Турбо",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Цена за час:",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

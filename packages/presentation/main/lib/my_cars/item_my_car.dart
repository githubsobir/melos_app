import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemMyCar extends StatelessWidget {
  const ItemMyCar({super.key, required this.carImage});
  final String carImage;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CachedNetworkImage(
          height: 48,
          width: 78,
          imageUrl: carImage,
          progressIndicatorBuilder:
              (context, url, downloadProgress) => SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          ),
          errorWidget: (context, url, error) =>
          const Icon(Icons.error),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "70L",
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
              "Руководство",
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
              "6 Люди",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(
                  color:
                  Theme.of(context).colorScheme.secondary),
            ),
          ],
        )
      ],
    );
  }
}

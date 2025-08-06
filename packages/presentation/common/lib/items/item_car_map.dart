import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCarMap extends StatelessWidget {
  final VoidCallback onPressed;
  final String carImage;
  final String carName;
  final String carLocation;
  final double carRating;

  const ItemCarMap({
    super.key,
    required this.onPressed,
    required this.carImage,
    required this.carName,
    required this.carRating,
    required this.carLocation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: SizedBox(
          width: 152,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: CachedNetworkImage(
                  height: 92,
                  width: 152,
                  imageUrl: carImage,
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            carName,
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 4, right: 4, bottom: 2, top: 2),
                          decoration: const BoxDecoration(
                            color: Color(0xFF3563E9),
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                          ),
                          child: Text(
                            '$carRating',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontSize: 8,
                                  color: Theme.of(context)
                                              .colorScheme
                                              .brightness ==
                                          Brightness.light
                                      ? Colors.white
                                      : Colors.white,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(PathImages.location1),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            carLocation,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(fontSize: 8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

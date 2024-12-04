import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/base_button.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCarMap extends StatelessWidget {
  final VoidCallback onPressed;
  final String carImage;
  final String carName;
  final String carStatus;
  final String carLocation;
  final double carRating;

  const ItemCarMap({
    super.key,
    required this.onPressed,
    required this.carImage,
    required this.carName,
    required this.carStatus,
    required this.carRating,
    required this.carLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 142,
        height: 216,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 16,
              ),
              CachedNetworkImage(
                height: 60,
                width: 100,
                imageUrl: carImage,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Text(
                carName,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Container(
                    height: 4,
                    width: 4,
                    decoration: const BoxDecoration(
                      color: Color(0xFF16ED38),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      carStatus,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontSize: 8),
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
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontSize: 8,
                            color: Theme.of(context).colorScheme.brightness ==
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
              const SizedBox(
                height: 12,
              ),
              BaseButton(
                onPressed: onPressed,
                title: "Открыть",
                fontSize: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

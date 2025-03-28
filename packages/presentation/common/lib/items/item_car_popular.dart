import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCarPopular extends StatefulWidget {
  final VoidCallback onPressed;
  final Function(bool isKed) onLike;
  final String carImage;
  final String carMake;
  final String carModel;
  final String carType;
  final String dailyRate;
  final String? originalPrice;
  final String transmission;
  final int passengerCapacity;
  final int fuelCapacity;
  bool isLiked;

  ItemCarPopular({
    super.key,
    required this.onPressed,
    required this.carImage,
    required this.carMake,
    required this.carType,
    required this.dailyRate,
    required this.originalPrice,
    required this.transmission,
    required this.passengerCapacity,
    required this.fuelCapacity,
    required this.onLike,
    required this.isLiked,
    required this.carModel,
  });

  @override
  State<ItemCarPopular> createState() => _ItemCarPopularState();
}

class _ItemCarPopularState extends State<ItemCarPopular> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        child: SizedBox(
          width: 240,
          height: 320,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: CachedNetworkImage(
                      height: 160,
                      width: 240,
                      imageUrl: widget.carImage,
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
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isLiked = !widget.isLiked;
                        });
                        widget.onLike(widget.isLiked);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: widget.isLiked
                            ? const Icon(
                                Icons.favorite_outlined,
                                color: Color(0xFFFF3636),
                              )
                            : Icon(
                                Icons.favorite_outline,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                widget.carMake,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              widget.carType,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        widget.carModel,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                        maxLines: 2,
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(PathImages.capacity),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "${widget.fuelCapacity}L",
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(PathImages.management),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                widget.transmission,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(PathImages.peoplesCount),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "${widget.passengerCapacity} Люди",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: '${widget.dailyRate} ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14),
                                    children: [
                                      TextSpan(
                                        text: "сум/день",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                widget.dailyRate != widget.originalPrice &&
                                        widget.originalPrice != null
                                    ? Text(
                                        "${widget.originalPrice} сум/день",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                fontSize: 14),
                                      )
                                    : Container(
                                        height: 8,
                                      ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCarPopular extends StatefulWidget {
  final VoidCallback onPressed;
  final Function(bool isKed) onLike;
  final String carImage;
  final String carName;
  final String carType;
  final String price;
  final String fullPrice;
  final int passengerCapacity;
  final int fuelCapacity;
  bool isLiked;

  ItemCarPopular({
    super.key,
    required this.onPressed,
    required this.carImage,
    required this.carName,
    required this.carType,
    required this.price,
    required this.fullPrice,
    required this.passengerCapacity,
    required this.fuelCapacity,
    required this.onLike,
    required this.isLiked,
  });

  @override
  State<ItemCarPopular> createState() => _ItemCarPopularState();
}

class _ItemCarPopularState extends State<ItemCarPopular> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 260,
        height: 280,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.carName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        widget.carType,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.isLiked = !widget.isLiked;
                    });
                    widget.onLike(widget.isLiked);
                  },
                  child: widget.isLiked
                      ? const Icon(
                          Icons.favorite_outlined,
                          color: Color(0xFFFF3636),
                        )
                      : Icon(
                          Icons.favorite_outline,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                )
              ],
            ),
            Expanded(
              child: CachedNetworkImage(
                height: 90,
                imageUrl: widget.carImage,
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
            const SizedBox(
              height: 16,
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
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
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
                      "Руководство",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
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
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
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
                        text: '${widget.price} ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 14),
                        children: [
                          TextSpan(
                            text: "сум/день",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${widget.fullPrice} 80 000 сум/день",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 14),
                    ),
                  ],
                )),
                BaseButton(
                  onPressed: widget.onPressed,
                  title: "Открыть",
                  fontSize: 12,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/base_button.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCarPopular extends StatelessWidget {
  final VoidCallback onPressed;
  final String carName;
  final String carType;
  final double price;
  final double fullPrice;

  const ItemCarPopular({
    super.key,
    required this.onPressed,
    required this.carName,
    required this.carType,
    required this.price,
    required this.fullPrice,
  });

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
                        carName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        carType,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: const Color(0xFF90A3BF)),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.favorite_outlined,
                  color: Color(0xFFFF3636),
                )
              ],
            ),
            Expanded(
              child: CachedNetworkImage(
                height: 90,
                imageUrl:
                    "https://www.hyundai.com/content/dam/hyundai/in/en/data/find-a-car/i20/Highlights/pc/i20_Modelpc.png",
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
                      "70L",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: const Color(0xFF90A3BF)),
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
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: const Color(0xFF90A3BF)),
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
                      "6 Люди",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: const Color(0xFF90A3BF)),
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
                        text: '\$$price/',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                            text: "день",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: const Color(0xFF90A3BF)),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "\$$fullPrice",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: const Color(0xFF90A3BF)),
                    ),
                  ],
                )),
                BaseButton(
                    onPressed: onPressed, title: "Забронировать\nсейчас",fontSize: 12,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

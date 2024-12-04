import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/base_button.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: ListView.builder(
          itemCount: 10,
          padding: const EdgeInsets.only(top: 16),
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
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
                              Text(
                                "SUV",
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
                    Row(
                      children: [
                        Expanded(
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://www.hyundai.com/content/dam/hyundai/in/en/data/find-a-car/i20/Highlights/pc/i20_Modelpc.png",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                    )),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                      ?.copyWith(
                                          color: const Color(0xFF90A3BF)),
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
                                      ?.copyWith(
                                          color: const Color(0xFF90A3BF)),
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
                                      ?.copyWith(
                                          color: const Color(0xFF90A3BF)),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: '\$88.00/',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                                children: [
                                  TextSpan(
                                    text: 'день',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: const Color(0xFF90A3BF)),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "\$110.00",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: const Color(0xFF90A3BF)),
                            ),
                          ],
                        )),
                        BaseButton(
                            onPressed: () {}, title: "Забронировать\nсейчас"),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

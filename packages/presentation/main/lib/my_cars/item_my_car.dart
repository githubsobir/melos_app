import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';

class ItemMyCar extends StatefulWidget {
  const ItemMyCar({super.key, required this.carImage});

  final String carImage;

  @override
  State<ItemMyCar> createState() => _ItemMyCarState();
}

class _ItemMyCarState extends State<ItemMyCar> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                          imageUrl: widget.carImage,
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
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "90 416 UZS",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Статус",
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Не сдается в аренду",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall?.copyWith(
                            color: const Color(0xFFFFAA17)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isVisible,
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 48,
                            width: 78,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
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
                                "12.12.2024",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Высадка:",
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.secondary),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "12.12.2024",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseButton(onPressed: () {}, title: "Принимать"),
                      BaseButton(
                        onPressed: () {},
                        title: "Контакт",
                        background: const Color(0xFFFFAA17),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

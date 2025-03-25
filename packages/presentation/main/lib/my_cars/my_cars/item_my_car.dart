import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/my_cars_intents.dart';

class ItemMyCar extends StatefulWidget {
  const ItemMyCar({
    super.key,
    required this.carImage,
    required this.onEdit,
    required this.carName,
    required this.carAvailable,
    required this.onChangeStatus,
  });

  final String carImage;
  final String carName;
  final bool carAvailable;
  final VoidCallback onEdit;
  final VoidCallback onChangeStatus;

  @override
  State<ItemMyCar> createState() => _ItemMyCarState();
}

class _ItemMyCarState extends State<ItemMyCar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: CachedNetworkImage(
              height: 150,
              width: double.infinity,
              imageUrl: widget.carImage,
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
            padding: const EdgeInsets.all(16.0),
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
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: leftRight(
                        title: "Местоположение",
                        icon: PathImages.nearbyCircled,
                        onTap: () {
                          context.openScreen(MyCarLocationIntent());
                        },
                      ),
                    ),
                    Expanded(
                      child: leftRight(
                        title: "Замок ",
                        icon: PathImages.lockDoors,
                        onTap: () {
                          context.openScreen(MyCarLocationIntent());
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: leftRight(
                        title: "Статус",
                        icon: widget.carAvailable
                            ? PathImages.carStatusEnabled
                            : PathImages.carStatusDisabled,
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust radius as needed
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Вы уверены, что хотите изменить статус машину ?',
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: BaseButton(
                                            onPressed: () {
                                              context.closeActiveScreen();
                                            },
                                            title: "Нет"),
                                      ),
                                      const SizedBox(
                                        width: 48,
                                      ),
                                      Expanded(
                                          child: BaseButton(
                                        onPressed: () {
                                          widget.onChangeStatus();
                                          context.closeActiveScreen();
                                        },
                                        title: "Да",
                                        background: const Color(0xFFFF3636),
                                      )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: leftRight(
                        title: "Удалить ",
                        icon: PathImages.removeCircledIcon,
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust radius as needed
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Вы уверены, что хотите удалить автомобиль из своей учетной записи?',
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: BaseButton(
                                            onPressed: () {
                                              context.closeActiveScreen();
                                            },
                                            title: "Нет"),
                                      ),
                                      const SizedBox(
                                        width: 48,
                                      ),
                                      Expanded(
                                          child: BaseButton(
                                        onPressed: () {
                                          context.closeActiveScreen();
                                        },
                                        title: "Да",
                                        background: const Color(0xFFFF3636),
                                      )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "12000",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "сум/день",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: widget.onEdit,
                      child: Icon(
                        Icons.edit,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  leftRight({
    required String title,
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 4),
          Text(
            title,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}

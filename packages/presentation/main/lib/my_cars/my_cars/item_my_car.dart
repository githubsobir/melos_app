import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/my_cars_intents.dart';

class ItemMyCar extends StatefulWidget {
  const ItemMyCar({super.key, required this.carImage});

  final String carImage;

  @override
  State<ItemMyCar> createState() => _ItemMyCarState();
}

class _ItemMyCarState extends State<ItemMyCar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: const Color(0xFFECE9FB),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
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
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                )),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.carImage,
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
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
                          "23L",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          leftRight(
            title: "See the location of the car",
            icon: PathImages.nearbyCircled,
            onTap: () {
              context.openScreen(MyCarLocationIntent());
            },
          ),
          leftRight(
            title: "Lock/Unlock your car",
            icon: PathImages.lockDoors,
            onTap: () {},
          ),
          leftRight(
            title: "Make it enable/disable on app",
            icon: PathImages.closedType,
            onTap: () {},
          ),
          leftRight(
            title: "Remove this car forever",
            icon: PathImages.removeCircledIcon,
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Adjust radius as needed
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
                            child: BaseButton(onPressed: () {}, title: "Нет"),
                          ),
                          const SizedBox(
                            width: 48,
                          ),
                          Expanded(
                              child: BaseButton(
                            onPressed: () {},
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
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "12000",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      Text(
                        "сум/день",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                BaseButton(onPressed: () {}, title: context.translations.open)
              ],
            ),
          ),
        ],
      ),
    );
  }

  leftRight({
    required String title,
    required String icon,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              GestureDetector(onTap: onTap, child: SvgPicture.asset(icon))
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

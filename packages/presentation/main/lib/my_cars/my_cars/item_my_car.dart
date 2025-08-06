import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intent_launcher/intent_launcher.dart';

class ItemMyCar extends StatefulWidget {
  const ItemMyCar({
    super.key,
    required this.carImage,
    required this.onEdit,
    required this.carName,
    required this.carAvailable,
    required this.onChangeStatus,
    required this.onCarLocation,
    required this.onDelete,
    required this.onLock,
    required this.dailyRate,
  });

  final String carImage;
  final String carName;
  final String dailyRate;
  final bool carAvailable;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onChangeStatus;
  final VoidCallback onCarLocation;
  final VoidCallback onLock;

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
                        title: context.translations.location,
                        icon: PathImages.nearbyCircled,
                        onTap: widget.onCarLocation,
                      ),
                    ),
                    Expanded(
                      child: leftRight(
                        title: context.translations.lock,
                        icon: PathImages.lockDoors,
                        onTap: widget.onLock,
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
                        title: context.translations.status,
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
                                  Text(
                                    context
                                        .translations.you_want_to_change_status,
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
                                            title: context.translations.no),
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
                                        title: context.translations.yes,
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
                        title: context.translations.delete,
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
                                  Text(
                                    context.translations.remove_the_vehicle,
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
                                          title: context.translations.no,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 48,
                                      ),
                                      Expanded(
                                          child: BaseButton(
                                        onPressed: () {
                                          widget.onDelete();
                                          context.closeActiveScreen();
                                        },
                                        title: context.translations.yes,
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
                      widget.dailyRate,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      context.translations.sum_day,
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

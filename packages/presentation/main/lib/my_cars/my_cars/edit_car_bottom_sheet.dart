import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/widgets/base_button.dart';
import 'package:common/widgets/textfield3.dart';
import 'package:domain/model/location/point_model.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/my_cars_intents.dart';

class EditCarBottomSheet extends StatefulWidget {
  final Function({
    required double latitude,
    required double longitude,
    required String dailyRate,
  }) onEdit;
  final String carName;
  final String image;
  final BuildContext ctx;

  const EditCarBottomSheet({
    super.key,
    required this.onEdit,
    required this.carName,
    required this.image,
    required this.ctx,
  });

  static Future show({
    required BuildContext context,
    required Function({
      required double latitude,
      required double longitude,
      required String dailyRate,
    }) onEdit,
    required String carName,
    required String image,
  }) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder: (ts) {
        return EditCarBottomSheet(
          onEdit: onEdit,
          carName: carName,
          image: image,
          ctx: context,
        );
      },
    );
  }

  @override
  State<EditCarBottomSheet> createState() => _EditCarBottomSheetState();
}

class _EditCarBottomSheetState extends State<EditCarBottomSheet> {
  TextEditingController dailyRateController = TextEditingController();
  double? latitude;
  double? longitude;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Card(
          margin: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ItemCarImage(imagePath: "$BASE_URL_IMAGE${widget.image}"),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: "$BASE_URL_IMAGE${widget.image}",
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
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
              Text(
                widget.carName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField3(
                        hint: "80 000",
                        controller: dailyRateController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: BaseButton(
                        fontSize: 12,
                        onPressed: () {
                          widget.ctx
                              .openScreen(SelectLocationScreenIntent())
                              .then(
                            (value) {
                              if (value is PointModel) {
                                setState(() {
                                  latitude = value.latitude;
                                  longitude = value.longitude;
                                });
                              }
                            },
                          );
                        },
                        title: "Локация",
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "${latitude ?? ""} ${longitude ?? ""}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 48,
              ),
              BaseButton(
                onPressed: () {
                  if (latitude != null && longitude != null) {
                    widget.onEdit(
                      dailyRate: dailyRateController.text,
                      latitude: latitude ?? 0,
                      longitude: longitude ?? 0,
                    );
                    context.closeActiveScreen();
                  }
                },
                title: context.translations.save,
                // fontSize: 12,
                width: 160,
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

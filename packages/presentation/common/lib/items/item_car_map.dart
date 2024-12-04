import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/base_button.dart';
import 'package:flutter/material.dart';

class ItemCarMap extends StatelessWidget {
  final VoidCallback onPressed;
  final String carName;
  final String carType;
  final double price;
  final double fullPrice;

  const ItemCarMap({
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
      child: SizedBox(
        width: 142,
        height: 216,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 16,
              ),
              CachedNetworkImage(
                height: 60,
                width: 100,
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
              Text(
                carName,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                carName,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                carName,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
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

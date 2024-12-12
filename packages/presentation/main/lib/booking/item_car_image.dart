import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemCarImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;

  const ItemCarImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: CachedNetworkImage(
          imageUrl: imagePath + "ssxxdd",
          fit: BoxFit.fill,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              SizedBox(
            width: width,
            height: height,
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
    );
  }
}

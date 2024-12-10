import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemCarImage extends StatelessWidget {
  final String imagePath;

  const ItemCarImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: imagePath,
        fit: BoxFit.fill,
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
    );
  }
}

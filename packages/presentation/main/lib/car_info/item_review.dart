import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/date_formats.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemReview extends StatelessWidget {
  const ItemReview({
    super.key,
    required this.image,
    required this.name,
    required this.date,
    required this.comment,
  });

  final String image;
  final String name;
  final String date;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(44.0),
                child: CachedNetworkImage(
                  imageUrl: "$BASE_URL_IMAGE$image",
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                    width: 44,
                    height: 44,
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
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      itemCount: 5,
                      itemSize: 12,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                DateFormats.dateFormat(date, context),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 44,
                height: 44,
              ),
              Expanded(
                child: Text(
                  comment,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

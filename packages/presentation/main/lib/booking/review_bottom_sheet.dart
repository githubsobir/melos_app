import 'package:common/l10n/build_context_extension.dart';
import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intent_launcher/intent_launcher.dart';

class ReviewBottomSheetContent extends StatefulWidget {
  final Function(int rating, String comment) onReview;

  const ReviewBottomSheetContent({super.key, required this.onReview});

  @override
  State<ReviewBottomSheetContent> createState() =>
      _ReviewBottomSheetContentState();
}

class _ReviewBottomSheetContentState extends State<ReviewBottomSheetContent> {
  TextEditingController commentController = TextEditingController();

  double rating = 5;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 8,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              context.translations.did_you_like_the_car,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    // color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              itemCount: 5,
              itemSize: 38,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (r) {
                setState(() {
                  rating = r;
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: commentController,
              maxLines: 6,
              style: Theme.of(context).textTheme.labelMedium,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 8,
                  bottom: 8,
                ),
                filled: true,
                hintText: context.translations.description,
                hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Color(0xFF658DF1)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Color(0xFF658DF1)),
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            BaseButton(
              onPressed: () {
                widget.onReview(rating.toInt(), commentController.text);
                context.closeActiveScreen();
              },
              title: context.translations.send,
              // fontSize: 12,
              width: 160,
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

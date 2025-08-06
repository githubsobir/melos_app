import 'package:common/l10n/build_context_extension.dart';
import 'package:common/widgets/base_button.dart';
import 'package:domain/model/cars/car_detail_info_model.dart';
import 'package:flutter/material.dart';
import 'package:main/car_info/item_review.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({super.key, required this.reviews});

  final List<ReviewsModel> reviews;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Adjust radius as needed
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    context.translations.ratings_and_reviews,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                BaseButton(onPressed: () {}, title: "${widget.reviews.length}")
              ],
            ),
            ListView.separated(
              separatorBuilder: (context, index) => Divider(color: Colors.grey, height: 1,),
              itemCount: showAll
                  ? widget.reviews.length
                  : (widget.reviews.length < 2 ? widget.reviews.length : 2),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ItemReview(
                  image: widget.reviews[index].clientImage ?? "",
                  name: widget.reviews[index].clientName ?? "",
                  date: widget.reviews[index].reviewDate ?? "",
                  comment: widget.reviews[index].comment ?? "",
                );
              },
            ),
            Visibility(
              visible: !showAll && widget.reviews.length > 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showAll = true;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.translations.show_all,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

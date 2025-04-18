import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteWidget extends StatefulWidget {
  bool isLiked;
  final Function(bool isLiked) onLike;

  FavouriteWidget({
    super.key,
    required this.isLiked,
    required this.onLike,
  });

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.isLiked = !widget.isLiked;
        widget.onLike(widget.isLiked);
        setState(() {});
      },
      child: widget.isLiked
          ? SvgPicture.asset(
              PathImages.favouriteOn,
              height: 24,
              width: 24,
            )
          : SvgPicture.asset(
              PathImages.favouriteOff,
              height: 24,
              width: 24,
            ),
    );
  }
}

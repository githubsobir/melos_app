import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarInfoDetailScreen extends StatelessWidget {
  const CarInfoDetailScreen({super.key, required this.carId});

  final num carId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          PathImages.logo,
        ),
      ),
    );
  }
}

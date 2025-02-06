import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        child: SvgPicture.asset(PathImages.chat),
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 16,
            ),
            item(
              context: context,
              title: "Контактный телефон",
              content: "+99893***0321",
            ),
            SizedBox(
              height: 16,
            ),
            item(
              context: context,
              title: "ПИНФЛ",
              content: "521120******25",
            ),
            SizedBox(
              height: 16,
            ),
            item(
              context: context,
              title: "Водительское Удостоверение",
              content: "AG 12****8",
            ),
          ],
        ),
      ),
    );
  }

  Widget item({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0), // Adjust radius as needed
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 36,
          right: 36,
          top: 16,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}

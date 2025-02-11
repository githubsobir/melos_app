import 'package:cached_network_image/cached_network_image.dart';
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
            itemProfile(
              context: context,
              firstName: "Kuchimov",
              middleName: "Azamat",
              lastName: "Nemadulla o'g'li",
              imagePath:
                  "https://plus.unsplash.com/premium_photo-1689977968861-9c91dbb16049?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D",
            ),
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

  Widget itemProfile({
    required BuildContext context,
    required String firstName,
    required String middleName,
    required String lastName,
    required String imagePath,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0), // Adjust radius as needed
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 16,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                  width: 100,
                  height: 100,
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
              width: 24,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    firstName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    middleName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    lastName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              height: 100,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
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

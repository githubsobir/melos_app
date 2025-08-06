import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class PickupAndReturnWidget extends StatelessWidget {
  final String location;
  final String urlLink;

  const PickupAndReturnWidget({super.key, required this.location, required this.urlLink});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0), // Adjust radius as needed
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 16,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.translations.pickUpAndReturn,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: const Color(0xFFC3D4E9).withOpacity(0.4),
                    ),
                  ),
                  child: SvgPicture.asset(
                    PathImages.locationRed,
                    height: 26,
                    width: 26,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.secondary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextButton.icon(
                      label: Text(    location,    style: TextStyle(
                        // decoration: TextDecoration.underline,
                        // decorationStyle: TextDecorationStyle.solid,
                        // decorationColor: Colors.blueAccent.shade700,
                          fontSize: 12,
                          decorationThickness: 0.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent.shade700)),
                      icon: const Icon(Icons.map), onPressed: () {
                    openMapsSheet(context);
                  },
                    iconAlignment: IconAlignment.end,



                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }



  openMapsSheet(context) async {
    try {



      try {
        final Uri url = Uri.parse(urlLink);

        if (await canLaunchUrl(url)) {
          await launchUrl(
            url,
            mode: LaunchMode.externalApplication, // Tashqi ilovada ochish
          );
        } else {
          throw 'Could not launch $urlLink';
        }
      } catch (e) {
        print('Error opening map: $e');
        // Xatolik bo'lsa browser da ochish
        await _openInBrowser(urlLink);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> _openInBrowser(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(
      uri,
      mode: LaunchMode.inAppWebView, // Ilova ichida web view
    );
  }

}

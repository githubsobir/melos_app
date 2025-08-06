import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectionBottomSheet extends StatelessWidget {
  const ConnectionBottomSheet({super.key});

  static Future<void> show({
    required BuildContext context,
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const Wrap(
          children: [ConnectionBottomSheet()],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ), // Adjust radius as needed
          ),
          margin: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.all(58.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(PathImages.noConnection),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  context.translations.internet_connection_is_unavailable,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  context.translations.please_check_connection,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 64,
                ),
                BaseButton(
                    onPressed: () {
                      InternetConnection().hasInternetAccess.then(
                        (value) {
                          if (context.mounted) {
                            if (value) {
                              context.closeActiveScreen();
                            }
                          }
                        },
                      );
                    },
                    title: context.translations.try_again)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

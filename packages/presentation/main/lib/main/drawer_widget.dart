import 'dart:async';

import 'package:common/font_family.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:dependency/dependencies/injector.dart';
import 'package:domain/utils/app_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatefulWidget {
  final bool hasUser;
  final VoidCallback onLogOut;
  final VoidCallback onLogIn;
  final VoidCallback onBooking;
  final VoidCallback onBookingHistory;
  final VoidCallback onMyCar;

  const DrawerWidget({
    super.key,
    required this.onLogOut,
    required this.onBooking,
    required this.onBookingHistory,
    required this.onMyCar,
    required this.hasUser,
    required this.onLogIn,
  });

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final AppStateNotifier _appStateNotifier = getIt.get<AppStateNotifier>();

  String appVersion = "";

  @override
  void initState() {
    PackageInfo.fromPlatform().then(
      (value) {
        setState(() {
          appVersion = value.version;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SvgPicture.asset(PathImages.logo),
                    Text(
                      "CarBNB",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: FontFamily.BOLD.name,
                        fontSize: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Scaffold.of(context).closeDrawer();
                      },
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
              ),
              const Divider(),
              item(
                icon: PathImages.booking,
                title: context.translations.booking,
                context: context,
                onTap: () {
                  widget.onBooking();
                  Scaffold.of(context).closeDrawer();
                },
              ),
              item(
                icon: PathImages.bookingHistory,
                title: context.translations.history,
                context: context,
                onTap: () {
                  widget.onBookingHistory();
                  Scaffold.of(context).closeDrawer();
                },
              ),
              item(
                icon: PathImages.myCars,
                title: context.translations.my_cars,
                context: context,
                onTap: () {
                  widget.onMyCar();
                  Scaffold.of(context).closeDrawer();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(),
              itemTheme(
                context: context,
                onTap: () {
                  _appStateNotifier.setThemeValue(
                      isNightMode: (Theme.of(context).colorScheme.brightness ==
                          Brightness.light));
                },
              ),
              itemLanguage(
                context: context,
                onTap: (langCode) {
                  _appStateNotifier.setLanguageValue(languageCode: langCode);
                },
              ),
              itemHelp(
                context: context,
                onTap: (isTelegram) async {
                  if (isTelegram) {
                    await launchUrl(Uri.parse("https://t.me/j_abubakr"));
                  } else {
                    await launchUrl(Uri.parse("tel:+998972000055"));
                  }
                  // Scaffold.of(context).closeDrawer();
                },
              ),
              widget.hasUser
                  ? item(
                      icon: PathImages.logout,
                      title: context.translations.exit,
                      context: context,
                      onTap: () {
                        showDialog<bool>(
                          context: context,
                          barrierDismissible: false,
                          // Dialog tashqarisiga bosganda yopilmasin
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: Text(
                                context.translations.exit,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              content: Text(
                                context.translations.exitAccount,
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(
                                              false); // "Yo'q" javob qaytaradi
                                        },
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          backgroundColor: Colors.blueAccent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            side: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                        ),
                                        child: Text(
                                          context.translations.no,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(
                                              true); // "Ha" javob qaytaradi
                                          widget.onLogOut();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey.shade200,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Text(
                                          context.translations.yes,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );

                        //
                      },
                    )
                  : item(
                      icon: PathImages.login,
                      title: context.translations.log_in,
                      context: context,
                      onTap: () {
                        widget.onLogIn();
                      },
                    ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.translations.version,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                " $appVersion",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget item({
    required String icon,
    required String title,
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.brightness == Brightness.light
                    ? const Color(0xFF050E2B)
                    : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget itemTheme({
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              Theme.of(context).colorScheme.brightness == Brightness.light
                  ? PathImages.darkMode
                  : PathImages.lightMode,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              Theme.of(context).colorScheme.brightness == Brightness.light
                  ? context.translations.dark
                  : context.translations.light,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget itemLanguage({
    required BuildContext context,
    required Function(String langCode) onTap,
  }) {
    return GestureDetector(
        onTapDown: (details) {
          // final RenderBox overlay =
          //     Overlay.of(context).context.findRenderObject() as RenderBox;
          // showMenu(
          //   context: context,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(8.0), // Adjust radius as needed
          //   ),
          //   position: RelativeRect.fromLTRB(
          //     details.globalPosition.dx,
          //     details.globalPosition.dy,
          //     overlay.size.width - details.globalPosition.dx,
          //     overlay.size.height - details.globalPosition.dy,
          //   ),
          //   items: [
          //     const PopupMenuItem(
          //         value: 'ru',
          //         child: SizedBox(
          //             width: 120, child: Center(child: Text('Русский')))),
          //     const PopupMenuItem(
          //         value: 'uz',
          //         child:
          //             SizedBox(width: 120, child: Center(child: Text('O`zbek')))),
          //   ],
          // ).then((value) {
          //   if (value != null) {
          //     Timer(
          //       const Duration(milliseconds: 100),
          //       () {
          //         onTap(value);
          //       },
          //     );
          //   }
          // });
        },
        child: ExpansionTile(
          shape: const Border(),
          // Chiziqlarni olib tashlash
          collapsedShape: const Border(),
          title: Row(
            children: [
              Icon(Icons.language, color: Colors.grey.shade800, size: 24),
              const SizedBox(width: 16),
              Text(
                context.translations.changeLanguage,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          expandedAlignment: Alignment.centerLeft,
          childrenPadding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          children: [
            Theme(
              data: ThemeData(textTheme: TextTheme()),
              child: ListTile(
                leading: SvgPicture.asset(
                  PathImages.langUz,
                ),
                title: Text(
                  "O'zbek",
                  style: TextTheme(
                      displayMedium: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.brightness ==
                            Brightness.light
                        ? const Color(0xFF050E2B)
                        : Colors.white,
                  )).displayMedium,
                ),
                onTap: () {
                  Timer(
                    const Duration(milliseconds: 100),
                    () {
                      onTap('uz');
                    },
                  );
                },
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                PathImages.langRu,
              ),
              title: const Text(
                'Русский',
              ),
              onTap: () {
                Timer(
                  const Duration(milliseconds: 100),
                  () {
                    onTap('ru');
                  },
                );
              },
            ),
          ],
        ));
  }

  Widget itemHelp({
    required BuildContext context,
    required Function(bool isTelegram) onTap,
  }) {
    return GestureDetector(
        onTapDown: (details) {
          // final RenderBox overlay =
          //     Overlay.of(context).context.findRenderObject() as RenderBox;
          // showMenu(
          //   context: context,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(8.0), // Adjust radius as needed
          //   ),
          //   position: RelativeRect.fromLTRB(
          //     details.globalPosition.dx,
          //     details.globalPosition.dy,
          //     overlay.size.width - details.globalPosition.dx,
          //     overlay.size.height - details.globalPosition.dy,
          //   ),
          //   items: [
          //     const PopupMenuItem(
          //         value: 'ru',
          //         child: SizedBox(
          //             width: 120, child: Center(child: Text('Русский')))),
          //     const PopupMenuItem(
          //         value: 'uz',
          //         child:
          //             SizedBox(width: 120, child: Center(child: Text('O`zbek')))),
          //   ],
          // ).then((value) {
          //   if (value != null) {
          //     Timer(
          //       const Duration(milliseconds: 100),
          //       () {
          //         onTap(value);
          //       },
          //     );
          //   }
          // });
        },
        child: ExpansionTile(
          shape: const Border(),
          // Chiziqlarni olib tashlash
          collapsedShape: const Border(),
          title: Row(
            children: [
              SvgPicture.asset(
                PathImages.help,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                context.translations.help,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          expandedAlignment: Alignment.centerLeft,
          childrenPadding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          children: [
            ListTile(
              leading:
                  Icon(Icons.telegram, color: Colors.blue.shade800, size: 24),
              title: Text(context.translations.telegram),
              onTap: () {
                onTap(true);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.green.shade800,
              ),
              title: Text(context.translations.call),
              onTap: () {
                Timer(
                  const Duration(milliseconds: 100),
                  () {
                    onTap(false);
                  },
                );
              },
            ),
          ],
        ));
  }

  Widget itemHelp123({
    required BuildContext context,
    required Function(bool isTelegram) onTap,
  }) {
    return GestureDetector(
      onTapDown: (details) {
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;
        showMenu(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Adjust radius as needed
          ),
          position: RelativeRect.fromLTRB(
            details.globalPosition.dx,
            details.globalPosition.dy,
            overlay.size.width - details.globalPosition.dx,
            overlay.size.height - details.globalPosition.dy,
          ),
          items: [
            PopupMenuItem(
                value: true,
                child: SizedBox(
                    width: 120,
                    child: Center(child: Text(context.translations.telegram)))),
            PopupMenuItem(
                value: false,
                child: SizedBox(
                    width: 120,
                    child: Center(child: Text(context.translations.call)))),
          ],
        ).then((value) {
          if (value != null) {
            Timer(
              const Duration(milliseconds: 100),
              () {
                onTap(value);
              },
            );
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              PathImages.help,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              context.translations.help,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}

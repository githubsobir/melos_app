import 'package:common/l10n/build_context_extension.dart';
import 'package:common/navigation/auth_navigation_intents.dart';
import 'package:common/path_images.dart';
import 'package:dependency/dependencies.dart';
import 'package:favourites/favourites_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home/home_screen.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:locations/locations_screen.dart';
import 'package:main/main/drawer_widget.dart';
import 'package:main/main/main_cubit.dart';
import 'package:navigation/main_navigation_intents.dart';
import 'package:profile/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final cubit = MainCubit(inject())..hasUserProfile();

  static final List<Widget> _mainScreens = <Widget>[];

  @override
  void initState() {
    _mainScreens.addAll([
      HomeScreen(),
      LocationsScreen(),
      Container(
        color: Colors.greenAccent,
      ),
      FavouritesScreen(),
      ProfileScreen(),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // onWillPop: () async {
    //   if (cubit.pageIndex == 0) {
    //     return true;
    //   } else {
    //     _onItemTapped(0);
    //     return false;
    //   }
    // },
    return BlocConsumer(
      bloc: cubit,
      listener: (BuildContext context, Object state) {
        if (state is LogOutState) {
          context.openScreen(LoginIntent());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: cubit.pageIndex != 1
              ? AppBar(
                  title: _getTitleFromPosition(cubit.pageIndex, context),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        // NotificationsScreen
                        context.openScreen(NotificationsScreenIntent());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 24),
                        width: 38,
                        height: 38,
                        child: Stack(
                          children: [
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border:
                                    Border.all(color: const Color(0xFFC0D8FF)),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(PathImages.notification),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 11,
                                width: 11,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: const Color(0xFFFF3636)
                                    // border: Border.all(color: const Color(0xFFC0D8FF)),
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : null,
          drawer: Drawer(
            child: DrawerWidget(
              onLogOut: () {
                cubit.logOut();
              },
            ),
          ),
          body: _mainScreens[cubit.pageIndex],
          bottomNavigationBar: SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  item(context, cubit.pageIndex == 0, PathImages.menuHome,
                      context.translations.home, () => _onItemTapped(0)),
                  item(context, cubit.pageIndex == 1, PathImages.menuLocation,
                      context.translations.next_to_me, () => _onItemTapped(1)),
                  item(context, cubit.pageIndex == 2, PathImages.menuAdd, "",
                      () => _onItemTapped(2)),
                  item(
                    context,
                    cubit.pageIndex == 3,
                    PathImages.menuFavourite,
                    context.translations.saved,
                    () {
                      if (cubit.hasUser) {
                        _onItemTapped(3);
                      } else {
                        context.openScreen(LoginIntent());
                      }
                    },
                  ),
                  item(
                    context,
                    cubit.pageIndex == 4,
                    PathImages.menuProfile,
                    context.translations.profile,
                    () {
                      if (cubit.hasUser) {
                        _onItemTapped(4);
                      } else {
                        context.openScreen(LoginIntent());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onItemTapped(int index) {
    if (index != 2) {
      cubit.changeMenuPosition(index);
    } else {
      print("addd");
    }
  }

  item(BuildContext context, bool isEnabled, String path, String title,
      VoidCallback onPressed) {
    return Expanded(
      child: isEnabled
          ? Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.brightness ==
                          Brightness.light
                      ? const Color(0xFFC0D8FF)
                      : const Color(0xFF102587),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onPressed,
                    child: SvgPicture.asset(
                      path,
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.brightness ==
                                Brightness.light
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.brightness ==
                                  Brightness.light
                              ? Theme.of(context).colorScheme.primary
                              : Colors.white,
                        ),
                  ),
                ],
              ),
            )
          : GestureDetector(
              onTap: onPressed,
              child: IconButton(
                onPressed: onPressed,
                icon: SvgPicture.asset(
                  path,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.brightness == Brightness.light
                        ? const Color(0xFF050E2B)
                        : Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
    );
  }

  Widget _getTitleFromPosition(int currentMenuPosition, BuildContext context) {
    switch (currentMenuPosition) {
      case 0:
        return SvgPicture.asset(
          PathImages.logo,
        );
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Text(context.translations.saved);
      case 4:
        return Text(context.translations.your_account);
      default:
        return Container();
    }
  }
}

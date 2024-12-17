import 'package:common/path_images.dart';
import 'package:dependency/dependencies/injector.dart';
import 'package:domain/utils/app_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/auth_navigation_intents.dart';
import 'package:navigation/main_navigation_intents.dart';
import 'package:navigation/my_cars_intents.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(PathImages.logo),
              IconButton(
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
        ),
        const Divider(),
        item(
          icon: PathImages.booking,
          title: "Бронирование",
          context: context,
          onTap: () {
            context.openScreen(BookingIntent());
            Scaffold.of(context).closeDrawer();
          },
        ),
        item(
          icon: PathImages.bookingHistory,
          title: "История бронирования",
          context: context,
          onTap: () {
            context.openScreen(BookingHistoryIntent());
            Scaffold.of(context).closeDrawer();
          },
        ),
        item(
          icon: PathImages.paymentDetails,
          title: "Реквизиты для оплаты",
          context: context,
          onTap: () {
            context.openScreen(PaymentDetailsIntent());
            Scaffold.of(context).closeDrawer();
          },
        ),
        item(
          icon: PathImages.myCars,
          title: "Мои машины",
          context: context,
          onTap: () {
            context.openScreen(MyCarsIntent());
            Scaffold.of(context).closeDrawer();
          },
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(),
        item(
          icon: PathImages.help,
          title: "Помощь",
          context: context,
          onTap: () {
            context.openScreen(HelpIntent());
            Scaffold.of(context).closeDrawer();
          },
        ),
        itemTheme(
          context: context,
          onTap: () {
            getIt.get<AppStateNotifier>().setValue(
                isNightMode: (Theme.of(context).colorScheme.brightness ==
                    Brightness.light));
          },
        ),
        item(
          icon: PathImages.logout,
          title: "Выйти",
          context: context,
          onTap: () {
            context.openScreen(LoginIntent());
          },
        ),
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
                  ? "Dark"
                  : "Light",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}

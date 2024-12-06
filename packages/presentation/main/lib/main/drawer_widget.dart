import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/main_navigation_intents.dart';

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
          title: "Booking",
          context: context,
          onTap: () {
            context.openScreen(BookingIntent());
            Scaffold.of(context).closeDrawer();
          },
        ),
        item(
          icon: PathImages.bookingHistory,
          title: "Booking history",
          context: context,
          onTap: () {
            context.openScreen(BookingHistoryIntent());
            Scaffold.of(context).closeDrawer();
          },
        ),
        item(
          icon: PathImages.paymentDetails,
          title: "Payment details",
          context: context,
          onTap: () {
            context.openScreen(PaymentDetailsIntent());
            Scaffold.of(context).closeDrawer();
          },
        ),
        item(
          icon: PathImages.myCars,
          title: "My cars",
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
          title: "Help",
          context: context,
          onTap: () {
            context.openScreen(HelpIntent());
            Scaffold.of(context).closeDrawer();
          },
        ),
        item(
          icon: PathImages.logout,
          title: "Logout",
          context: context,
          onTap: () {

            Scaffold.of(context).closeDrawer();
          },
        ),
      ],
    );
  }

  Widget item(
      {required String icon,
      required String title,
      required BuildContext context,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Row(
          children: [
            SvgPicture.asset(icon),
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
}

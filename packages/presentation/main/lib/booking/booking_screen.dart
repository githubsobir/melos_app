import 'package:common/l10n/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:main/booking/item_booking.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      appBar: AppBar(
        title: Text(context.translations.booking),
        toolbarHeight: 72,
        bottom: TabBar(
          controller: tabController,
          padding: const EdgeInsets.all(16),
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 12,
              ),
          unselectedLabelStyle:
              Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
          tabs: const [
            Tab(
              text: "ТЕКУЩИЕ",
            ),
            Tab(
              text: "ВСЕ",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView.separated(
            itemBuilder: (context, index) => const ItemBooking(),
            separatorBuilder: (context, index) => const Divider(
              color: Color(0xFF658DF1),
            ),
            itemCount: 3,
          ),
          ListView.separated(
            itemBuilder: (context, index) => const ItemBooking(),
            separatorBuilder: (context, index) => const Divider(
              color: Color(0xFF658DF1),
            ),
            itemCount: 3,
          )
        ],
      ),
    );
  }
}

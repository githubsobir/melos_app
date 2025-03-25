import 'package:common/l10n/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:main/my_cars/my_cars/item_my_car.dart';
import 'package:main/my_cars/my_cars/my_cars_cubit.dart';

import 'item_current_booking_car.dart';

class MyCarsScreen extends StatefulWidget {
  MyCarsScreen({super.key});

  @override
  State<MyCarsScreen> createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen>
    with SingleTickerProviderStateMixin {
  final MyCarsCubit cubit = MyCarsCubit();

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Мои машины"),
      // ),
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
          ListView.builder(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 24,
            ),
            itemBuilder: (context, index) {
              return ItemCurrentBookingCar(
                carImage:
                    "https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?cs=srgb&dl=pexels-pixabay-210019.jpg&fm=jpg",
                onConfirmBooking: () {},
              );
            },
            itemCount: 4,
          ),
          ListView.builder(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 24,
            ),
            itemBuilder: (context, index) {
              return ItemMyCar(
                carImage:
                    "https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?cs=srgb&dl=pexels-pixabay-210019.jpg&fm=jpg",
                onEdit: () {},
              );
            },
            itemCount: 4,
          )
        ],
      ),
    );
  }
}

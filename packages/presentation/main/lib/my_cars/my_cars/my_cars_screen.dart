import 'package:common/l10n/build_context_extension.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:main/my_cars/my_cars/item_my_car.dart';
import 'package:main/my_cars/my_cars/my_cars_cubit.dart';
import 'package:navigation/main_navigation_intents.dart';

import 'item_current_booking_car.dart';

class MyCarsScreen extends StatefulWidget {
  const MyCarsScreen({super.key});

  @override
  State<MyCarsScreen> createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen>
    with SingleTickerProviderStateMixin {
  final MyCarsCubit cubit = MyCarsCubit(inject())
    ..getMyCars()
    ..currentCarsOwners();

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translations.my_cars),
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
          RefreshIndicator(
            onRefresh: () {
              cubit.currentCarsOwners();
              return Future<void>.delayed(const Duration(seconds: 1));
            },
            child: BlocBuilder<MyCarsCubit, MyCarsState>(
              bloc: cubit,
              buildWhen: (previous, current) => current is CurrentCarsState,
              builder: (context, state) {
                print("state birinchisi ${state}");
                if (state is CurrentCarsState) {
                  return ListView.builder(
                    itemCount: state.cars.length,
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 24,
                    ),
                    itemBuilder: (context, index) {
                      return ItemCurrentBookingCar(
                        carImage:
                            "$BASE_URL_IMAGE${state.cars[index].photo}",
                        onConfirmBooking: () {
                          context.openScreen(ReceivingTheCarScreenIntent(
                              bookingId: state.cars[index].id ?? 0));
                        },
                      );
                    },
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: const SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                    ),
                  );
                }
              },
            ),
          ),
          RefreshIndicator(
            onRefresh: () {
              cubit.getMyCars();
              return Future<void>.delayed(const Duration(seconds: 1));
            },
            child: BlocBuilder<MyCarsCubit, MyCarsState>(
              bloc: cubit,
              buildWhen: (previous, current) => current is CarsState,
              builder: (context, state) {
                print("state ikkinchisi ${state}");
                if (state is CarsState) {
                  return ListView.builder(
                    itemCount: state.cars.length,
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 24,
                    ),
                    itemBuilder: (context, index) {
                      return ItemMyCar(
                        carImage: "$BASE_URL_IMAGE${state.cars[index].photo}",
                        onEdit: () {},
                        carName:
                            "${state.cars[index].model} ${state.cars[index].make}",
                        carAvailable: state.cars[index].status == "available",
                        onChangeStatus: () {
                          if (state.cars[index].id != null) {
                            cubit.changeCarStatus(state.cars[index].id!);
                          }
                        },
                      );
                    },
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: const SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

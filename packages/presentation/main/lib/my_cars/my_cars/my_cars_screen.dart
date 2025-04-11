import 'package:common/l10n/build_context_extension.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:main/my_cars/my_cars/edit_car_bottom_sheet.dart';
import 'package:main/my_cars/my_cars/item_my_car.dart';
import 'package:main/my_cars/my_cars/my_cars_cubit.dart';
import 'package:navigation/main_navigation_intents.dart';
import 'package:navigation/my_cars_intents.dart';

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
      body: BlocBuilder<MyCarsCubit, MyCarsState>(
        bloc: cubit,
        builder: (ctx, state) {
          return TabBarView(
            controller: tabController,
            children: [
              RefreshIndicator(
                onRefresh: () {
                  cubit.currentCarsOwners();
                  return Future<void>.delayed(const Duration(seconds: 1));
                },
                child: ListView.builder(
                  itemCount: state.currentCars.length,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 24,
                  ),
                  itemBuilder: (context, index) {
                    return ItemCurrentBookingCar(
                      carImage:
                          "$BASE_URL_IMAGE${state.currentCars[index].photo}",
                      onConfirmBooking: () {
                        context
                            .openScreen(ConfirmBookingScreenIntent(
                                contractId: state.currentCars[index].id ?? 0))
                            .then(
                          (value) {
                            if (value != null && value == true) {
                              cubit.currentCarsOwners();
                              cubit.getMyCars();
                            }
                          },
                        );
                      },
                      onComplete: () {
                        cubit.onCompleteCar(state.currentCars[index].id ?? 0);
                      },
                      carStatus: "${state.currentCars[index].status}",
                      carName:
                          "${state.currentCars[index].make} ${state.currentCars[index].model}",
                      startDate: "${state.currentCars[index].startDate}",
                      endDate: "${state.currentCars[index].endDate}",
                      clientProfileImage:
                          "${state.currentCars[index].clientProfileImage}",
                      clientProfileName:
                          "${state.currentCars[index].clientFirstName} ${state.currentCars[index].clientLastName}",
                      clientProfilePhone:
                          "${state.currentCars[index].clientPhoneNumber}",
                    );
                  },
                ),
              ),
              RefreshIndicator(
                onRefresh: () {
                  cubit.getMyCars();
                  return Future<void>.delayed(const Duration(seconds: 1));
                },
                child: ListView.builder(
                  itemCount: state.myCars.length,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 24,
                  ),
                  itemBuilder: (ctx, index) {
                    return ItemMyCar(
                      carImage: "$BASE_URL_IMAGE${state.myCars[index].photo}",
                      onEdit: () {
                        EditCarBottomSheet.show(
                          context: context,
                          onEdit: ({
                            required dailyRate,
                            required latitude,
                            required longitude,
                          }) {
                            cubit.updateCar(
                              id: state.myCars[index].id ?? 0,
                              dailyRate: dailyRate,
                              latitude: latitude,
                              longitude: longitude,
                            );
                          },
                          carName:
                              "${state.myCars[index].make} ${state.myCars[index].model}",
                          image: "${state.myCars[index].photo}",
                        );
                      },
                      carName:
                          "${state.myCars[index].model} ${state.myCars[index].make}",
                      carAvailable: state.myCars[index].isActive ?? false,
                      onChangeStatus: () {
                        if (state.myCars[index].id != null) {
                          cubit.changeCarStatus(state.myCars[index].id!);
                        }
                      },
                      onCarLocation: () {
                        context.openScreen(
                          MyCarLocationIntent(
                            id: state.myCars[index].id ?? 0,
                          ),
                        );
                      },
                      onDelete: () {
                        cubit.deleteCar(state.myCars[index].id ?? 0);
                      },
                      onLock: () {
                        context.openScreen(
                          LockScreenIntent(
                            id: state.myCars[index].id ?? 0,
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

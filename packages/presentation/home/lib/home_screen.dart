import 'dart:developer';

import 'package:common/bloc/date_time_cubit.dart';
import 'package:common/items/item_car.dart';
import 'package:common/items/item_car_popular.dart';
import 'package:common/l10n/build_context_extension.dart';
import 'package:common/widgets/date_selector_widget.dart';
import 'package:common/widgets/search_edittext.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/filter/filter_bottom_sheet.dart';
import 'package:home/home_cubit.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:navigation/my_cars_intents.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final cubit = HomeCubit(inject())
    ..filter()
    ..popularCars()
    ..recommendedCars(isRefreshed: true);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  Map<String, dynamic> val = {};

  @override
  void initState() {
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          widget.cubit.recommendedCars();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:
      Theme.of(context).colorScheme.brightness == Brightness.light
          ? const Color(0xFFF6F7F9)
          : const Color(0xFF061136),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: widget.cubit,
        builder: (context, state) {
          return Column(
            children: [
              Card(
                // elevation: 0,
                // shape: const OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide.none),
                elevation: 0,
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0), // Adjust radius as needed
                ),
                child: Container(
                  padding:
                  const EdgeInsets.only(left: 24, right: 24, bottom: 12, top: 10),
                  child: SearchEdittext(
                    onTextChange: (productName) {
                      widget.cubit.search(productName);
                    },
                    onFilter: () {
                      FilterBottomSheet.show(
                        context: context,
                        cubit: widget.cubit,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () {
                    widget.cubit.popularCars(isRefreshed: true);
                    widget.cubit.recommendedCars(isRefreshed: true);
                    return Future<void>.delayed(const Duration(seconds: 1));
                  },
                  child: ListView(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      DateSelectorWidget(
                        endDateTime: context.read<DateTimeCubit>().state!.endTime!.toIso8601String(),
                        startDateTime: context.read<DateTimeCubit>().state!.startTime!.toIso8601String(),
                        onRangeSelected: (dateRange, timeRange) {
                          print(
                              "xaxaaxa ${dateRange.toString()} - ${timeRange.toString()}");
                          var start = dateRange.startDate;
                          var end = dateRange.endDate;

                          if (start != null && end != null) {
                            DateTime startDate = DateTime(
                                start.year,
                                start.month,
                                start.day,
                                timeRange.start.hour,
                                timeRange.start.minute);
                            DateTime endDate = DateTime(
                                end.year,
                                end.month,
                                end.day,
                                timeRange.end.hour,
                                timeRange.end.minute);

                            context
                                .read<DateTimeCubit>()
                                .setDateTime(startDate, endDate);

                            widget.cubit.setDateTime(
                                startDataTime: startDate.toIso8601String(),
                                endDataTime: endDate.toIso8601String());
                          }
                        },
                      ),
                      Visibility(
                        visible: state.popular.isNotEmpty,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                context.translations.popular_car,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 326,
                              child: ListView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(right: 24),
                                scrollDirection: Axis.horizontal,
                                itemCount: state.popular.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                    Padding(
                                      padding: const EdgeInsets.only(left: 24),
                                      child: ItemCarPopular(
                                        onPressed: () {


                                          context.openScreen(CarInfoDetailIntent(
                                            startDateTime: context
                                                .read<DateTimeCubit>()
                                                .state!
                                                .startTime!
                                                .toIso8601String(),
                                            endDateTime: context
                                                .read<DateTimeCubit>()
                                                .state!
                                                .endTime!
                                                .toIso8601String(),
                                            carId: state.popular[index].id ?? 0,
                                          ));
                                        },
                                        carImage:
                                        "$BASE_URL_IMAGE${state.popular[index].photo}",
                                        carMake: "${state.popular[index].make}",
                                        carModel: "${state.popular[index].model}",
                                        carType: "${state.popular[index].category}",
                                        dailyRate:
                                        (state.popular[index].dailyRate ?? ""),
                                        originalPrice:
                                        state.popular[index].originalPrice,
                                        passengerCapacity: (state.popular[index]
                                            .passengerCapacity ??
                                            0)
                                            .toInt(),
                                        fuelCapacity:
                                        (state.popular[index].fuelCapacity ?? 0)
                                            .toInt(),
                                        onLike: (isLiked) {
                                          widget.cubit.likeCar(
                                              state.popular[index], isLiked);
                                        },
                                        isLiked:
                                        (state.popular[index].liked ?? false),
                                        transmission:
                                        "${state.popular[index].transmission}",
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: state.recommended.isNotEmpty,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  context.translations.recommendation_car,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              ListView.builder(
                                itemCount: state.recommended.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24),
                                  child: ItemCarBase(
                                    carImage:
                                    "$BASE_URL_IMAGE${state.recommended[index].photo}",
                                    carMake: "${state.recommended[index].make}",
                                    carModel:
                                    "${state.recommended[index].model}",
                                    carType:
                                    "${state.recommended[index].category}",
                                    dailyRate:
                                    (state.recommended[index].dailyRate ??
                                        ""),
                                    originalPrice: (state
                                        .recommended[index].originalPrice),
                                    onPressed: () {
                                      context.openScreen(CarInfoDetailIntent(
                                        startDateTime: context
                                            .read<DateTimeCubit>()
                                            .state!
                                            .startTime!
                                            .toString(),
                                        endDateTime: context
                                            .read<DateTimeCubit>()
                                            .state!
                                            .endTime!
                                            .toString(),
                                        carId: state.recommended[index].id ?? 0,
                                      ));
                                    },
                                    passengerCapacity: (state.recommended[index]
                                        .passengerCapacity ??
                                        0)
                                        .toInt(),
                                    fuelCapacity: (state.recommended[index]
                                        .fuelCapacity ??
                                        0)
                                        .toInt(),
                                    onLike: (isLiked) async {
                                      widget.cubit.likeCar(
                                          state.recommended[index], isLiked);
                                    },
                                    isLiked: (state.recommended[index].liked ??
                                        false),
                                    transmission: (state
                                        .recommended[index].transmission ??
                                        ""),
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );


  }
}

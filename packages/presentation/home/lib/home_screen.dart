import 'package:common/items/item_car.dart';
import 'package:common/items/item_car_popular.dart';
import 'package:common/search_edittext.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/cars_cubit.dart';
import 'package:home/widgets/date_selector_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final cubit = CarsCubit(inject())
    ..likedCars()
    ..recommendedCars();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

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
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      body: BlocBuilder<CarsCubit, CarsState>(
        bloc: widget.cubit,
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () {
              widget.cubit.likedCars(isRefreshed: true);
              widget.cubit.recommendedCars(isRefreshed: true);
              return Future<void>.delayed(const Duration(seconds: 1));
            },
            child: ListView(
              controller: _scrollController,
              children: [
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(0),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SearchEdittext(
                          onTextChange: (productName) {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                DateSelectorWidget(),
                Visibility(
                  visible: state.liked.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Популярный автомобиль",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Text(
                              "Просмотреть все",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 280,
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(right: 24),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.liked.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: ItemCarPopular(
                              onPressed: () {},
                              carImage:
                                  "$BASE_URL_IMAGE${state.liked[index].photo}",
                              carName: "${state.liked[index].make}",
                              carType: "${state.liked[index].category}",
                              price: (state.liked[index].originalPrice ?? ""),
                              fullPrice:
                                  (state.liked[index].originalPrice ?? ""),
                              passengerCapacity:
                                  (state.liked[index].passengerCapacity ?? 0)
                                      .toInt(),
                              fuelCapacity:
                                  (state.liked[index].fuelCapacity ?? 0)
                                      .toInt(),
                              onLike: (isLiked) {
                                widget.cubit.likeCar(
                                    (state.liked[index].id ?? 0).toInt(),
                                    isLiked);
                              },
                              isLiked: (state.liked[index].liked ?? false),
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
                            "Рекомендация Автомобиль",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                        ListView.builder(
                          itemCount: state.recommended.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: ItemCarBase(
                              carImage:
                                  "$BASE_URL_IMAGE${state.recommended[index].photo}",
                              carName: "${state.recommended[index].make}",
                              carType: "${state.recommended[index].category}",
                              price: (state.recommended[index].originalPrice ??
                                  ""),
                              fullPrice:
                                  (state.recommended[index].originalPrice ??
                                      ""),
                              onPressed: () {},
                              passengerCapacity:
                                  (state.recommended[index].passengerCapacity ??
                                          0)
                                      .toInt(),
                              fuelCapacity:
                                  (state.recommended[index].fuelCapacity ?? 0)
                                      .toInt(),
                              onLike: (isLiked) {
                                widget.cubit.likeCar(
                                    (state.recommended[index].id ?? 0).toInt(),
                                    isLiked);
                              },
                              isLiked:
                                  (state.recommended[index].liked ?? false),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}

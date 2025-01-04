import 'package:common/base_loader_builder.dart';
import 'package:common/items/item_car.dart';
import 'package:common/items/item_car_popular.dart';
import 'package:common/search_edittext.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/cars_cubit.dart';
import 'package:home/widgets/date_selector_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final carsCubit = CarsCubit(inject())..carsList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      body: ListView(
        children: [
          Card(
            elevation: 0,
            margin: const EdgeInsets.all(0),
            child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
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
          const Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: DateSelectorWidget(),
          ),
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
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  "Просмотреть все",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
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
              padding: EdgeInsets.only(right: 24),
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.only(left: 24),
                child: ItemCarPopular(
                  onPressed: () {},
                  carImage:
                      "https://www.hyundai.com/content/dam/hyundai/in/en/data/find-a-car/i20/Highlights/pc/i20_Modelpc.png",
                  carName: "carName",
                  carType: "carType",
                  price: 100,
                  fullPrice: 300,
                  passengerCapacity: 100,
                  fuelCapacity: 200,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Рекомендация Автомобиль",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          BlocBuilder(
            bloc: carsCubit,
            builder: (context, state) {
              return BaseLoaderBuilder(
                hasLoading: state is CarsLoaderState,
                child: state is CarListState
                    ? ListView.builder(
                        itemCount: state.carsModel.recommendCars.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: ItemCarBase(
                            carImage:
                                "$BASE_URL${state.carsModel.recommendCars[index].firstPhotoUrl}",
                            carName:
                                "${state.carsModel.recommendCars[index].make}",
                            carType:
                                "${state.carsModel.recommendCars[index].category}",
                            price: (state.carsModel.recommendCars[index]
                                        .originalPrice ??
                                    0)
                                .toDouble(),
                            fullPrice: (state.carsModel.recommendCars[index]
                                        .originalPrice ??
                                    0)
                                .toDouble(),
                            onPressed: () {},
                            passengerCapacity: (state
                                        .carsModel
                                        .recommendCars[index]
                                        .passengerCapacity ??
                                    0)
                                .toInt(),
                            fuelCapacity: (state.carsModel.recommendCars[index]
                                        .fuelCapacity ??
                                    0)
                                .toInt(),
                            onLike: () {
                              carsCubit.likeCar(
                                  (state.carsModel.recommendCars[index].id ?? 0)
                                      .toInt());
                            },
                            isLiked: true,
                          ),
                        ),
                      )
                    : Container(),
              );
            },
          )
        ],
      ),
    );
  }
}

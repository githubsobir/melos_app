import 'package:common/items/item_car.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/utils/constants.dart';
import 'package:favourites/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/my_cars_intents.dart';
import 'package:intent_launcher/intent_launcher.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({super.key});

  final cubit = FavouriteCubit(inject())..likedCars();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.light
              ? const Color(0xFFF6F7F9)
              : const Color(0xFF061136),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          return RefreshIndicator(
              onRefresh: () {
                cubit.likedCars(isRefreshed: true);
                return Future<void>.delayed(const Duration(seconds: 1));
              },
              child: (state is CarsState)
                  ? ListView.builder(
                      itemCount: state.liked.length,
                      padding:
                          const EdgeInsets.only(top: 16, left: 24, right: 24),
                      itemBuilder: (context, index) {
                        return ItemCarBase(
                          onPressed: () {
                            context.openScreen(CarInfoDetailIntent(
                              carId: state.liked[index].id ?? 0,
                            ));
                          },
                          carImage:
                              "$BASE_URL_IMAGE${state.liked[index].photo}",
                          carName: "${state.liked[index].make}",
                          carType: "${state.liked[index].category}",
                          price: (state.liked[index].originalPrice ?? ""),
                          fullPrice: (state.liked[index].originalPrice ?? ""),
                          passengerCapacity:
                              (state.liked[index].passengerCapacity ?? 0)
                                  .toInt(),
                          fuelCapacity:
                              (state.liked[index].fuelCapacity ?? 0).toInt(),
                          onLike: (isLiked) {
                            cubit.likeCar(
                                (state.liked[index].id ?? 0).toInt(), isLiked);
                          },
                          isLiked: (state.liked[index].liked ?? false),
                        );
                      },
                    )
                  : (state is LoadingState)
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox());
        },
      ),
    );
  }
}

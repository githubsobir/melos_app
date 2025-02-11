import 'package:common/items/item_car_map.dart';
import 'package:common/path_images.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:latlong2/latlong.dart';
import 'package:locations/locations_cubit.dart';
import 'package:navigation/my_cars_intents.dart';

class LocationsScreen extends StatelessWidget {
  LocationsScreen({super.key});

  final MapController _mapController = MapController();
  final cubit = LocationsCubit(inject())..likedCars();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(PathImages.locationRed),
            const SizedBox(
              width: 4,
            ),
            Text(
              "Коратош, 35, Шайхантохур",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
      body: BlocBuilder<LocationsCubit, LocationsState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is CarsState) {
            return Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialZoom: 17,
                    initialCenter: const LatLng(50.5, 30.51),
                    onMapEvent: (MapEvent event) {},
                    onMapReady: () {},
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: const LatLng(50.5, 30.51),
                          child: SvgPicture.asset(
                            PathImages.locationPin,
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.brightness ==
                                    Brightness.light
                                ? const Color(0xFF3563E9)
                                : const Color(0xFF3563E9),
                          ),
                          color: Theme.of(context).colorScheme.brightness ==
                                  Brightness.light
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFF050E2B),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Center(
                            child: SvgPicture.asset(PathImages.locationFilled)),
                      ),
                      Container(
                        height: 216,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(right: 24, left: 12),
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: ItemCarMap(
                              onPressed: () {
                                context.openScreen(CarInfoDetailIntent(
                                  carId: state.liked[index].id ?? 0,
                                ));
                              },
                              carImage: "$BASE_URL_IMAGE${state.liked[index].photo}",
                              carName: "${state.liked[index].make}",
                              carStatus: "Доступный",
                              carRating: 4.6,
                              carLocation: "улица Гейдара, 5",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

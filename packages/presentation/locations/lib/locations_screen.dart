import 'package:common/items/item_car_map.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_loader_builder.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:locations/locations_cubit.dart';
import 'package:navigation/my_cars_intents.dart';
import 'package:yandex_maps_mapkit_lite/image.dart' as image_provider;
import 'package:yandex_maps_mapkit_lite/mapkit.dart';
import 'package:yandex_maps_mapkit_lite/mapkit_factory.dart';
import 'package:yandex_maps_mapkit_lite/yandex_map.dart';

class LocationsScreen extends StatefulWidget {
  LocationsScreen({super.key});

  final cubit = LocationsCubit(inject())
    ..initMap()
    ..gpsList();

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  MapWindow? _mapWindow;

  @override
  void initState() {
    mapkit.onStart();
    super.initState();
  }

  @override
  void dispose() {
    mapkit.onStop();
    super.dispose();
  }

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
        bloc: widget.cubit,
        builder: (context, state) {
          return BaseLoaderBuilder(
            hasLoading: state.isLoading,
            child: Stack(
              children: [
                YandexMap(
                  // platformViewType: PlatformViewType.Hybrid,
                  onMapCreated: (mapWindow) {
                    print("Map ready");
                    _mapWindow = mapWindow;
                    // _mapWindow?.map.zoomGesturesEnabled = true;

                    _mapWindow?.map.move(
                      const CameraPosition(
                        Point(latitude: 41.313755, longitude: 69.248912),
                        zoom: 17.0,
                        azimuth: 150.0,
                        tilt: 30.0,
                      ),
                    );

                    // _mapWindow?.map.mapObjects.addPlacemarkWithImage(
                    //   const Point(latitude: 41.313755, longitude: 69.248912),
                    //   image_provider.ImageProvider.fromImageProvider(
                    //     AssetImage(PathImages.locationPinPng),
                    //   ),
                    // );
                    for (var e in state.gps) {
                      _mapWindow?.map.mapObjects.addPlacemarkWithImage(
                        Point(
                            latitude: (e.latitude ?? 0).toDouble(),
                            longitude: (e.longitude ?? 0).toDouble()),
                        image_provider.ImageProvider.fromImageProvider(
                          AssetImage(PathImages.locationPinPng),
                        ),
                      );
                    }
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Container(
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
                              child:
                                  SvgPicture.asset(PathImages.locationFilled)),
                        ),
                        onTap: () async {
                          try {
                            Geolocator.requestPermission().then((value) async {
                              if (await Geolocator.isLocationServiceEnabled()) {
                                Position? position =
                                    await Geolocator.getLastKnownPosition();
                                if (position != null) {
                                  _mapWindow?.map.move(
                                    CameraPosition(
                                      Point(
                                        latitude: position.latitude,
                                        longitude: position.longitude,
                                      ),
                                      zoom: 14.0,
                                      azimuth: 150.0,
                                      tilt: 30.0,
                                    ),
                                  );
                                  widget.cubit.gpsList();
                                  // controller.centerPosition(LatLng(
                                  //   position.latitude,
                                  //   position.longitude,
                                  // ));
                                  // controller.getLocationAddressByLatLon(
                                  //     position.latitude,
                                  //     position.longitude);
                                }
                              } else {
                                await Geolocator.openLocationSettings();
                              }
                            }).onError((error, stackTrace) async {
                              await Geolocator.openLocationSettings();
                              print("MAP-ERROR->:$error");
                            });
                          } catch (e) {
                            await Geolocator.openLocationSettings();
                            print("MAP-ERROR:$e");
                          }
                        },
                      ),
                      Container(
                        height: 160,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(right: 24, left: 12),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.gps.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: ItemCarMap(
                              onPressed: () {
                                context.openScreen(CarInfoDetailIntent(
                                  carId: state.gps[index].id ?? 0,
                                ));
                              },
                              carImage:
                                  "$BASE_URL_IMAGE${state.gps[index].photo}",
                              carName: "${state.gps[index].make}",
                              carRating:
                                  (state.gps[index].rating ?? 0).toDouble(),
                              carLocation: "${state.gps[index].address}",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

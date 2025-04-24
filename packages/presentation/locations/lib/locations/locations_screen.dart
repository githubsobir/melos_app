import 'package:common/items/item_car_map.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_loader_builder.dart';
import 'package:dependency/dependencies.dart';
import 'package:domain/model/location/gps_model.dart';
import 'package:domain/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:locations/locations/locations_cubit.dart';
import 'package:navigation/my_cars_intents.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class LocationsScreen extends StatefulWidget {
  LocationsScreen({super.key});

  final cubit = LocationsCubit(inject())
    ..geocoder()
    ..nearestCars();

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  YandexMapController? mapController;
  final List<MapObject> mapObjects = [];
  GpsModel? selectedCar;
  Point? selectedCarPoint;
  bool isSelectedCarVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationsCubit, LocationsState>(
      bloc: widget.cubit,
      builder: (context, state) {
        var allCars = [];
        allCars.addAll(state.nearestCar.nearest ?? []);
        allCars.addAll(state.nearestCar.others ?? []);
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(PathImages.locationRed),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    state.locationName,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                  ),
                )
              ],
            ),
          ),
          body: BaseLoaderBuilder(
            hasLoading: state.isLoading,
            child: Stack(
              children: [
                YandexMap(
                  mapObjects: mapObjects,
                  onCameraPositionChanged:
                      (CameraPosition cameraPosition, reason, finished) {
                    print(selectedCarPoint?.latitude.toStringAsFixed(4));
                    print(cameraPosition.target.latitude.toStringAsFixed(4));
                    print(selectedCarPoint?.longitude.toStringAsFixed(4));
                    print(cameraPosition.target.longitude.toStringAsFixed(4));
                    if (finished &&
                        selectedCarPoint?.latitude.toStringAsFixed(4) ==
                            cameraPosition.target.latitude.toStringAsFixed(4) &&
                        selectedCarPoint?.longitude.toStringAsFixed(4) ==
                            cameraPosition.target.longitude
                                .toStringAsFixed(4)) {
                      setState(() {
                        isSelectedCarVisible = true;
                      });
                    } else {
                      setState(() {
                        isSelectedCarVisible = false;
                      });
                    }
                  },
                  onMapCreated: (YandexMapController controller) {
                    mapController = controller;
                    mapController?.moveCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: state.point,
                          zoom: 14.0,
                          azimuth: 150.0,
                          tilt: 30.0,
                        ),
                      ),
                    );
                    for (var e in allCars) {
                      var mapObject = PlacemarkMapObject(
                        onTap: (mapObject, point) {
                          mapController?.moveCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: point,
                                zoom: 14.0,
                                azimuth: 150.0,
                                tilt: 30.0,
                              ),
                            ),
                            animation: const MapAnimation(
                              type: MapAnimationType.smooth,
                              duration: 1.0,
                            ),
                          );
                          selectedCarPoint = point;
                          selectedCar = e;
                        },
                        mapId: MapObjectId("${e.id}"),
                        point: Point(
                          latitude: (e.latitude ?? 0).toDouble(),
                          longitude: (e.longitude ?? 0).toDouble(),
                        ),
                        icon: PlacemarkIcon.single(
                          PlacemarkIconStyle(
                            image: BitmapDescriptor.fromAssetImage(
                              PathImages.locationPinPng,
                            ),
                            rotationType: RotationType.noRotation,
                          ),
                        ),
                        text: const PlacemarkText(
                          text: "",
                          style: PlacemarkTextStyle(
                            placement: TextStylePlacement.top,
                          ),
                        ),
                      );
                      mapObjects.add(mapObject);
                    }
                    setState(() {});
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
                                mapController?.moveCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                      target: state.point,
                                      zoom: 14.0,
                                      azimuth: 150.0,
                                      tilt: 30.0,
                                    ),
                                  ),
                                  animation: const MapAnimation(
                                    type: MapAnimationType.smooth,
                                    duration: 1.0,
                                  ),
                                );
                                widget.cubit.geocoder();
                                widget.cubit.nearestCars();
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
                          itemCount: state.nearestCar.nearest?.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: ItemCarMap(
                              onPressed: () {
                                var camera = CameraPosition(
                                  target: Point(
                                    latitude: (state.nearestCar.nearest?[index]
                                                .latitude ??
                                            0)
                                        .toDouble(),
                                    longitude: (state.nearestCar.nearest?[index]
                                                .longitude ??
                                            0)
                                        .toDouble(),
                                  ),
                                  zoom: 14.0,
                                  azimuth: 150.0,
                                  tilt: 30.0,
                                );
                                mapController?.moveCamera(
                                  CameraUpdate.newCameraPosition(camera),
                                  animation: const MapAnimation(
                                    type: MapAnimationType.smooth,
                                    duration: 1.0,
                                  ),
                                );
                                selectedCarPoint = camera.target;
                                selectedCar = state.nearestCar.nearest?[index];
                              },
                              carImage:
                                  "$BASE_URL_IMAGE${state.nearestCar.nearest?[index].photo}",
                              carName:
                                  "${state.nearestCar.nearest?[index].make} ${state.nearestCar.nearest?[index].model}",
                              carRating:
                                  (state.nearestCar.nearest?[index].rating ?? 0)
                                      .toDouble(),
                              carLocation:
                                  "${state.nearestCar.nearest?[index].address}",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelectedCarVisible)
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 160,
                      margin: const EdgeInsets.only(bottom: 200),
                      child: ItemCarMap(
                        onPressed: () {
                          context.openScreen(CarInfoDetailIntent(
                            carId: selectedCar?.id ?? 0,
                          ));
                        },
                        carImage: "$BASE_URL_IMAGE${selectedCar?.photo}",
                        carName: "${selectedCar?.make} ${selectedCar?.model}",
                        carRating: (selectedCar?.rating ?? 0).toDouble(),
                        carLocation: "${selectedCar?.address}",
                      ),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}

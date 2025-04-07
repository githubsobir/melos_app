import 'package:common/path_images.dart';
import 'package:dependency/dependencies/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locations/my_car/my_car_location_cubit.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MyCarLocationScreen extends StatefulWidget {
  final num id;

  final cubit = MyCarLocationCubit(inject());

  MyCarLocationScreen({
    super.key,
    required this.id,
  }) {
    cubit.gpsLocation(id: id);
  }

  @override
  State<MyCarLocationScreen> createState() => _MyCarLocationScreenState();
}

class _MyCarLocationScreenState extends State<MyCarLocationScreen> {
  YandexMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCarLocationCubit, CarLocationState>(
      bloc: widget.cubit,
      builder: (context, state) {
        if (state is CarLocationGPSState) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  SvgPicture.asset(PathImages.locationRed),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      state.point.address != null
                          ? state.point.address ?? ""
                          : '',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                ],
              ),
            ),
            body: Stack(
              children: [
                YandexMap(
                  mapObjects: [
                    PlacemarkMapObject(
                      mapId: const MapObjectId("car_location_id"),
                      point: Point(
                          latitude: (state.point.latitude ?? 0).toDouble(),
                          longitude: (state.point.longitude ?? 0).toDouble()),
                      icon: PlacemarkIcon.single(PlacemarkIconStyle(
                        image: BitmapDescriptor.fromAssetImage(
                          PathImages.locationPinPng,
                        ),
                        rotationType: RotationType.noRotation,
                      )),
                      text: const PlacemarkText(
                        text: "",
                        style: PlacemarkTextStyle(
                          placement: TextStylePlacement.top,
                        ),
                      ),
                    )
                  ],
                  onMapCreated: (mapWindow) {
                    mapController = mapWindow;
                    mapController?.moveCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: Point(
                              latitude: (state.point.latitude ?? 0).toDouble(),
                              longitude:
                                  (state.point.longitude ?? 0).toDouble()),
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
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(0.0), // Adjust radius as needed
                    ),
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(PathImages.capacity),
                              Text("${state.point.fuelCapacity}"),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(PathImages.speedometer),
                              Text("${state.point.speed}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is CarLocationLoadingState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

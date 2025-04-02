import 'package:common/path_images.dart';
import 'package:dependency/dependencies/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locations/car_location_cubit.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MyCarLocationScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  final cubit = CarLocationCubit(inject());

  MyCarLocationScreen({
    super.key,
    required this.latitude,
    required this.longitude,
  }) {
    cubit.geocoder(latitude: latitude, longitude: longitude);
  }

  @override
  State<MyCarLocationScreen> createState() => _MyCarLocationScreenState();
}

class _MyCarLocationScreenState extends State<MyCarLocationScreen> {
  YandexMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarLocationCubit, CarLocationState>(
      bloc: widget.cubit,
      builder: (context, state) {
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
                    state is CarLocationName ? state.locationName : '',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
          body: YandexMap(
            mapObjects: [
              PlacemarkMapObject(
                mapId: const MapObjectId("car_location_id"),
                point: Point(
                    latitude: (widget.latitude).toDouble(),
                    longitude: (widget.longitude).toDouble()),
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
                      latitude: widget.latitude,
                      longitude: widget.longitude,
                    ),
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
        );
      },
    );
  }
}

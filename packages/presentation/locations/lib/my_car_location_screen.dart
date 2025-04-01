import 'package:common/path_images.dart';
import 'package:dependency/dependencies/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:locations/car_location_cubit.dart';
import 'package:yandex_maps_mapkit_lite/image.dart' as image_provider;
import 'package:yandex_maps_mapkit_lite/mapkit.dart';
import 'package:yandex_maps_mapkit_lite/mapkit_factory.dart';
import 'package:yandex_maps_mapkit_lite/yandex_map.dart';

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
            onMapCreated: (mapWindow) {
              _mapWindow = mapWindow;
              _mapWindow?.map.move(
                CameraPosition(
                  Point(
                    latitude: widget.latitude,
                    longitude: widget.longitude,
                  ),
                  zoom: 17.0,
                  azimuth: 150.0,
                  tilt: 30.0,
                ),
              );
              _mapWindow?.map.mapObjects.addPlacemarkWithImage(
                Point(
                  latitude: widget.latitude,
                  longitude: widget.longitude,
                ),
                image_provider.ImageProvider.fromImageProvider(
                  AssetImage(PathImages.locationPinPng),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

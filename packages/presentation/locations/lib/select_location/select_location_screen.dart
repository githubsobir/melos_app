import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:locations/select_location/select_location_cubit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SelectLocationScreen extends StatefulWidget {
  SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  final cubit = SelectLocationCubit(inject())
    ..geocoder(
      latitude: 41.313755,
      longitude: 69.248912,
    );

  Point? userLocation;

  YandexMapController? mapController;

  @override
  initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );


      setState(() {
        userLocation = Point(
          latitude: position.latitude,
          longitude: position.longitude,
        );
      });

      // User location-ni mapga qo'shish
      _addUserLocationToMap();
    } catch (e) {
      print('Location olishda xato: $e');
    }
  }



  void _addUserLocationToMap() {
    if (userLocation != null) {
      var userLocationMarker = PlacemarkMapObject(
        mapId: const MapObjectId('user_location'),
        point: userLocation!,
        opacity: 0.8,

        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(PathImages.locationRedPng1),
            scale: 2

        )),
      );

      mapObjects.add(userLocationMarker);
      setState(() {

      });

    }
  }

  final List<MapObject> mapObjects = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectLocationCubit, SelectLocationState>(
      bloc: cubit,
      builder: (context, state) {
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
                    state.point?.address ?? "",
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
          body: Stack(
            children: [
              YandexMap(
                mapObjects: mapObjects,
                onMapCreated: (mapWindow) {
                  mapController = mapWindow;
                  mapController?.moveCamera(
                    CameraUpdate.newCameraPosition(
                      const CameraPosition(
                        target: Point(
                          latitude: 41.313755,
                          longitude: 69.248912,
                        ),
                        zoom: 14.0,
                        azimuth: 150.0,
                        tilt: 30.0,
                      ),
                    ),
                  );
                },
                onCameraPositionChanged: (cameraPosition, reason, finished) {
               if(finished) {
                    cubit.geocoder(
                      latitude: cameraPosition.target.latitude,
                      longitude: cameraPosition.target.longitude,
                    );
                  }
                },
                onUserLocationAdded: (UserLocationView view) async {
                  // User location view sozlamalari
                  return view.copyWith(
                    pin: view.pin.copyWith(
                      icon: PlacemarkIcon.single(
                        PlacemarkIconStyle(
                          image: BitmapDescriptor.fromAssetImage(
                            'assets/user_location.png',
                          ),
                          scale: 0.8,
                        ),
                      ),
                    ),
                    arrow: view.arrow.copyWith(
                      icon: PlacemarkIcon.single(
                        PlacemarkIconStyle(
                          image: BitmapDescriptor.fromAssetImage(
                            'assets/arrow.png',
                          ),
                          scale: 0.8,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(PathImages.locationRed),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BaseButton(
                    width: double.maxFinite,
                    onPressed: () {
                      if (context.mounted) {
                        context.closeActiveScreen(state.point);
                      }
                    },
                    title: context.translations.choose,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

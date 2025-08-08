
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
  final cubit = SelectLocationCubit(inject());

  Point? userLocation;
  Point? selectedLocation; // Tanlangan joylashuv uchun
  YandexMapController? mapController;
  bool isLocationPermissionGranted = false;
  bool isLoadingLocation = true;

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
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(PathImages.locationRedPng1),
            scale: 2)),
      );

      mapObjects.add(userLocationMarker);
      setState(() {});
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
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    state.point?.address ?? "Manzilni tanlang",
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            actions: [
              if (userLocation != null)
                IconButton(
                  icon: const Icon(Icons.my_location),
                  onPressed: () async {
                    // User location ga qaytarish
                    await mapController?.moveCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: userLocation!,
                          zoom: 16.0,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
          body: Stack(
            children: [
              YandexMap(
                mapObjects: mapObjects,
                zoomGesturesEnabled: true,
                mapType: MapType.map,
                onMapCreated: (controller) {
                  mapController = controller;
                  if (userLocation != null) {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      mapController?.moveCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: userLocation!,
                            zoom: 16.0,
                            azimuth: 0.0, // 0° = Shimol yuqorida
                            tilt: 0.0,
                          ),
                        ),
                      );
                    });
                  }
                },
                onCameraPositionChanged: (cameraPosition, reason, finished) {
                  if (finished) {
                    // Tanlangan location ni yangilash
                    setState(() {
                      selectedLocation = cameraPosition.target;
                    });

                    // Geocoding
                    cubit.geocoder(
                      latitude: cameraPosition.target.latitude,
                      longitude: cameraPosition.target.longitude,
                    );
                  }
                },
              ),

              // Loading indicator
              // GestureDetector(
              //   child: Container(
              //     height: 40,
              //     width: 40,
              //     margin: const EdgeInsets.all(16),
              //     padding: const EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //       border: Border.all(
              //         color: Theme.of(context).colorScheme.brightness ==
              //             Brightness.light
              //             ? const Color(0xFF3563E9)
              //             : const Color(0xFF3563E9),
              //       ),
              //       color: Theme.of(context).colorScheme.brightness ==
              //           Brightness.light
              //           ? const Color(0xFFFFFFFF)
              //           : const Color(0xFF050E2B),
              //       borderRadius:
              //       const BorderRadius.all(Radius.circular(6)),
              //     ),
              //     child: Center(
              //         child:
              //         SvgPicture.asset(PathImages.locationFilled)),
              //   ),
              //   onTap: () async {
              //     try {
              //       Geolocator.requestPermission().then((value) async {
              //         if (await Geolocator.isLocationServiceEnabled()) {
              //           mapController?.moveCamera(
              //             CameraUpdate.newCameraPosition(
              //               CameraPosition(
              //                 target: state.point,
              //                 zoom: 14.0,
              //                 azimuth: 150.0,
              //                 tilt: 30.0,
              //               ),
              //             ),
              //             animation: const MapAnimation(
              //               type: MapAnimationType.smooth,
              //               duration: 0.5,
              //             ),
              //           );
              //         } else {
              //           await Geolocator.openLocationSettings();
              //         }
              //       }).onError((error, stackTrace) async {
              //         await Geolocator.openLocationSettings();
              //         print("MAP-ERROR->:$error");
              //       });
              //     } catch (e) {
              //       await Geolocator.openLocationSettings();
              //       print("MAP-ERROR:$e");
              //     }
              //   },
              // ),

              // Markazda pin
              Align(
                alignment: Alignment.center,
                child: Container(
                  transform: Matrix4.translationValues(0, -20, 0),
                  // Pin ni yuqoriga ko'tarish
                  child: SvgPicture.asset(
                    PathImages.locationRed,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),

              // Tanlash tugmasi
              Positioned(
                bottom: 20,
                left: 10,
                right: 10,
                child: BaseButton(
                  width: double.maxFinite,
                  onPressed: selectedLocation != null
                      ? () {
                          if (context.mounted) {
                            // Tanlangan koordinata va manzil bilan qaytarish
                            final result = {
                              'point': selectedLocation,
                              'address': state.point?.address,
                              'latitude': selectedLocation!.latitude,
                              'longitude': selectedLocation!.longitude,
                            };
                            context.closeActiveScreen(result);
                          }
                        }
                      : null,
                  title: context.translations.choose,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Yangi method: faqat kamera harakati uchun
  Future<void> _getUserCurrentLocation() async {
    try {
      // Loading ko'rsatish
      setState(() {
        isLoadingLocation = true;
      });

      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          isLoadingLocation = false;
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 10),
      );

      final point = Point(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      setState(() {
        userLocation = point;
        selectedLocation = point;
        isLoadingLocation = false;
      });

      // Cubit orqali geocoding
      cubit.geocoder(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      // Kamera harakati
      await mapController?.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: point,
            zoom: 16.0,
          ),
        ),
      );

      // Marker ni yangilash
      _addUserLocationToMap();

      // Success snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Joriy joylashuvingiz topildi'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      print('Location olishda xato: $e');
      setState(() {
        isLoadingLocation = false;
      });

      // Error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location olishda xato: ${e.toString()}'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}

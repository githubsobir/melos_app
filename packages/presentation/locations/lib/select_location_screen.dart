import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:domain/model/location/point_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  YandexMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
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
          ),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(PathImages.locationRed),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BaseButton(
              width: double.maxFinite,
              onPressed: () {
                mapController?.getCameraPosition().then(
                  (target) {
                    if (context.mounted) {
                      context.closeActiveScreen(PointModel(
                        latitude: target.target.latitude,
                        longitude: target.target.longitude,
                      ));
                    }
                  },
                );
              },
              title: "Выбрать",
            ),
          ),
        ],
      ),
    );
  }
}

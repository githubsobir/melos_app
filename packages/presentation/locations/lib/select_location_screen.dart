import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:domain/model/location/point_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
// import 'package:yandex_maps_mapkit_lite/mapkit.dart';
// import 'package:yandex_maps_mapkit_lite/mapkit_factory.dart';
// import 'package:yandex_maps_mapkit_lite/yandex_map.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  // MapWindow? _mapWindow;
  //
  // @override
  // void initState() {
  //   mapkit.onStart();
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   mapkit.onStop();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: (mapWindow) {
              // _mapWindow = mapWindow;
              // _mapWindow?.map.move(
              //   const CameraPosition(
              //     Point(
              //       latitude: 41.313755,
              //       longitude: 69.248912,
              //     ),
              //     zoom: 17.0,
              //     azimuth: 150.0,
              //     tilt: 30.0,
              //   ),
              // );
            },
          ),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(PathImages.locationRed),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: BaseButton(
          //       width: double.maxFinite,
          //       onPressed: () {
          //         Point? target = _mapWindow?.map.cameraPosition.target;
          //         if (target != null) {
          //           context.closeActiveScreen(PointModel(
          //             latitude: target.latitude,
          //             longitude: target.longitude,
          //           ));
          //         } else {
          //           context.closeActiveScreen();
          //         }
          //       },
          //       title: "Выбрать"),
          // ),
        ],
      ),
    );
  }
}

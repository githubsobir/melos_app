import 'package:common/l10n/build_context_extension.dart';
import 'package:common/path_images.dart';
import 'package:common/widgets/base_button.dart';
import 'package:dependency/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intent_launcher/intent_launcher.dart';
import 'package:locations/select_location/select_location_cubit.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SelectLocationScreen extends StatelessWidget {
  SelectLocationScreen({super.key});

  final cubit = SelectLocationCubit(inject())
    ..geocoder(
      latitude: 41.313755,
      longitude: 69.248912,
    );
  YandexMapController? mapController;

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
                  cubit.geocoder(
                    latitude: cameraPosition.target.latitude,
                    longitude: cameraPosition.target.longitude,
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
                    if (context.mounted) {
                      context.closeActiveScreen(state.point);
                    }
                  },
                  title: context.translations.choose,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

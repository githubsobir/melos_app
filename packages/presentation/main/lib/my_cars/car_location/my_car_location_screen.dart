import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

class MyCarLocationScreen extends StatelessWidget {
  MyCarLocationScreen({super.key});

  final MapController _mapController = MapController();

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
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialZoom: 14,
          initialCenter: const LatLng(41.313755, 69.248912),
          onMapEvent: (MapEvent event) {},
          onMapReady: () {},
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: const LatLng(
                  41.313755,
                  69.248912,
                ),
                child: SvgPicture.asset(
                  PathImages.locationPin,
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

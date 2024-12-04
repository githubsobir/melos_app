import 'package:common/items/item_car_map.dart';
import 'package:common/items/item_car_popular.dart';
import 'package:common/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

class LocationsScreen extends StatelessWidget {
  final MapController _mapController = MapController();

  LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialZoom: 17,
              initialCenter: const LatLng(50.5, 30.51),
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
                    point: const LatLng(50.5, 30.51),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 216,
              margin: const EdgeInsets.only(bottom: 16),
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(right: 24,left: 12),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: ItemCarMap(
                    onPressed: () {},
                    carName: "Малибу 2 Турбо",
                    carType: "carType",
                    price: 100,
                    fullPrice: 300,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

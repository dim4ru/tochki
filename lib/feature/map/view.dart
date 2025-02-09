import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

import '../marker/view.dart';


class MapView extends GetView<MapController> {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(CupertinoIcons.pin_fill),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(54.989221, 73.368456),
          initialZoom: 15,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          CurrentLocationLayer(),
          MarkerLayer(
            markers: [
              PermanentMarker(point: LatLng(54.989221, 73.368456), markerId: 123, text: 'Норм место', imageUrl: '/Users/dim4/Downloads/pexels-stevedoessteve-28144564.jpg'),
              PermanentMarker(point: LatLng(54.987500, 73.370000), markerId: 456, text: 'Крутое место'),
            ],
          ),
        ],
      ),
    );
  }
}
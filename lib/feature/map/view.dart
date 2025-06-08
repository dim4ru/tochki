import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:tochki/feature/map/controller.dart';

import '../place/form/form.dart';

class MapView extends GetView<MapController> {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fm.FlutterMap(
        mapController: controller.fmController,
        options: fm.MapOptions(
          initialCenter: LatLng(54.989221, 73.368456),
          initialZoom: 15,
          onMapEvent: (event) {
            if (event is fm.MapEventMoveEnd) {
              final bounds = event.camera.visibleBounds;
              controller.onMapMoved(bounds);
            }
          },
          onLongPress: (tapPos, latLng) {
            // Переход на форму и передача latLng
            Get.to(
              () => PlaceForm(
                formType: FormType.create,
                initialLocation: latLng,
              ),
              transition: Transition.downToUp,
              duration: const Duration(milliseconds: 300),
            );
          },
        ),
        children: [
          fm.TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          CurrentLocationLayer(),
          fm.MarkerLayer(
            markers: controller.markers,
          ),
        ],
      ),
    );
  }
}
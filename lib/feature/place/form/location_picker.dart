import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:latlong2/latlong.dart';

import '../../../shared/ui_kit/colors.dart';
import '../../../shared/ui_kit/typography.dart';

class LocationPicker extends GetView<LocationPickerController> {
  final LatLng initialCenter;

  const LocationPicker({super.key, required this.initialCenter});

  @override
  Widget build(BuildContext context) {
    Get.put(LocationPickerController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Выберите точку на карте', style: TTypography.body1,),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.black,
        child: Icon(CupertinoIcons.checkmark, color: TColors.white,),
        onPressed: () {
          if (controller.pickedLocation.value != null) {
            Get.back(result: controller.pickedLocation.value);
          }
        },
      ),
      body: FlutterMap(
        mapController: MapController(),
        options: MapOptions(
          initialCenter: initialCenter,
          initialZoom: 15,
          onMapEvent: (event) {
            if (event is MapEventMoveEnd) {
              controller.pickedLocation.value = event.camera.center;
            }
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          CurrentLocationLayer(),
          Center(
            child: Icon(
              CupertinoIcons.plus,
              color: TColors.black,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

}

class LocationPickerController extends GetxController {
  final pickedLocation = Rxn<LatLng>();
}
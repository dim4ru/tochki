import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:tochki/shared/colors.dart';
import '../place/view.dart';
import 'controller.dart';

class PermanentMarker extends Marker {
  PermanentMarker({required super.point, required int markerId})
      : super(
    child: GetBuilder<PermanentMarkerController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            // controller.setActive(markerId); // Устанавливаем активный маркер
            Get.to(Place());
          },
          child: Icon(
            Icons.location_pin,
            color: TColors.pinOrange,
            size: 50,
          ),
        );
      },
    ),
  );
}

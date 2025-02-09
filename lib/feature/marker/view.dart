import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:tochki/shared/colors.dart';
import '../../shared/styles.dart';
import '../place/view.dart';
import 'controller.dart';

class PermanentMarker extends Marker {
  final String? imageUrl;
  final String text;

  PermanentMarker({
    required super.point,
    required int markerId,
    this.imageUrl,
    required this.text,
  }) : super(
          width: 100,
          height: 300,
          child: GetBuilder<PermanentMarkerController>(
            builder: (controller) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                    Place(),
                    transition: Transition.downToUp,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                child: Column(
                  children: [
                    Icon(CupertinoIcons.burst_fill,
                        color: TColors.pinOrange,
                        size: 36,
                        shadows: TStyles.pinShadows),
                    Text(
                      text,
                      style: TextStyle(
                          color: TColors.pinOrange,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          shadows: TStyles.pinShadows),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        );
}

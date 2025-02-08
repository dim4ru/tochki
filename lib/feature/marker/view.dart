import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class PermanentMarker extends Marker {
  const PermanentMarker({required super.point})
      : super(child: const Icon(Icons.location_pin, color: Color(0xffFF5600), size: 50));
}

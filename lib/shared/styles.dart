import 'dart:ui';

import 'package:flutter/material.dart';

class TStyles {
  static const pinShadows = [
    Shadow(
      offset: Offset(0, 0),
      blurRadius: 1,
      color: Colors.white,
    ),
    Shadow(
      offset: Offset(1, 1),
      blurRadius: 1,
      color: Colors.white,
    ),
    Shadow(
      offset: Offset(-1, -1),
      blurRadius: 1,
      color: Colors.white,
    ),
    Shadow(
      offset: Offset(1, -1),
      blurRadius: 1,
      color: Colors.white,
    ),
    Shadow(
      offset: Offset(-1, 1),
      blurRadius: 1,
      color: Colors.white,
    ),
  ];
}
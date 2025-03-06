import 'package:flutter/material.dart';

final class TSpacers extends ThemeExtension<TSpacers> {
  static const spacing0 = 0.0;
  static const spacing1 = 2.0;
  static const spacing2 = 4.0;
  static const spacing3 = 8.0;
  static const spacing4 = 12.0;
  static const spacing5 = 16.0;
  static const spacing6 = 20.0;
  static const spacing7 = 24.0;
  static const spacing8 = 32.0;
  static const spacing9 = 40.0;

  @override
  ThemeExtension<TSpacers> copyWith() {
    return this;
  }

  @override
  ThemeExtension<TSpacers> lerp(
      ThemeExtension<TSpacers>? other,
      double t,
      ) {
    return this;
  }
}

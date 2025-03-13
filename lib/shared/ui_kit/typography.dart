import 'package:flutter/material.dart';

class TTypography {

  static const fontFamily = 'Roboto';

  // Large
  static const promo = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    height: 1.125, // коэффициент для line height (32/28)
    fontSize: 32,
  );

  static const headline1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    height: 1.3, // коэффициент для line height (20/26)
    fontSize: 20,
  );

  static const headline2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    height: 1.2, // коэффициент для line height (20/24)
    fontSize: 20,
  );

  // Medium
  static const body1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    height: 1.25, // коэффициент для line height (16/20)
    fontSize: 16,
  );

  static const body2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    height: 1.25, // коэффициент для line height (16/20)
    fontSize: 16,
  );

  static const body3 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    height: 1.29, // коэффициент для line height (14/18)
    fontSize: 14,
  );

  static const body4 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    height: 1.29, // коэффициент для line height (14/18)
    fontSize: 14,
  );

  // Small
  static const caption1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    height: 1.17, // коэффициент для line height (12/14)
    fontSize: 12,
  );

  static const caption2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    height: 1.17, // коэффициент для line height (12/14)
    fontSize: 12,
  );

  static const tag1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    height: 1.2, // коэффициент для line height (10/12)
    fontSize: 10,
  );

  static const tag2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    height: 1.2, // коэффициент для line height (10/12)
    fontSize: 10,
  );
}

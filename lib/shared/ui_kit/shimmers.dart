import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tochki/shared/ui_kit/typography.dart';

import 'colors.dart';

class TShimmers {
  static var imageShimmer = Shimmer.fromColors(
    baseColor: TColors.black,
    highlightColor: TColors.gray,
    child: Container(
      width: double.infinity,
      height: double.infinity,
      color: TColors.white,
    ),
  );

  static Widget get textShimmer {
    // Используем TextPainter для измерения размера текста
    TextStyle textStyle = TTypography.body3;
    String text = '00%';  // Текст, который будет отображаться

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    return Shimmer.fromColors(
      baseColor: TColors.black,
      highlightColor: TColors.gray,
      child: Container(
        width: textPainter.size.width,  // Ширина контейнера равна ширине текста
        height: textPainter.size.height,  // Высота контейнера равна высоте текста
        color: TColors.white,
      ),
    );
  }

  static Widget sizedShimmer(TextStyle style) {
    // Используем TextPainter для измерения размера текста
    TextStyle textStyle = style;
    String text = '00%';  // Текст, который будет отображаться

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    return Shimmer.fromColors(
      baseColor: TColors.black,
      highlightColor: TColors.gray,
      child: Container(
        width: textPainter.size.width,  // Ширина контейнера равна ширине текста
        height: textPainter.size.height,  // Высота контейнера равна высоте текста
        color: TColors.white,
      ),
    );
  }
}
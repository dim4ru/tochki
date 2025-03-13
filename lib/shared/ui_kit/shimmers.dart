import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

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
}
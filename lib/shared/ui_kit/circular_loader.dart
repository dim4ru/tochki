import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class TCircularLoader extends StatelessWidget {
  const TCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: TColors.white,
      strokeWidth: 5,
      strokeCap: StrokeCap.round,
    );
  }
}

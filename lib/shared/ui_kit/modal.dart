import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'colors.dart';

class TModal {
  static void showTModal(BuildContext context, Widget content) {
    showBarModalBottomSheet(
      context: context,
      backgroundColor: TColors.black,
      builder: (context) => AnimatedSize(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutSine,
        child: content,
      ),
    );
  }
}

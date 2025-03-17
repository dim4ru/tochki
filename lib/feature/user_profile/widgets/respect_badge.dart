import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tochki/shared/ui_kit/typography.dart';

import '../../../../shared/ui_kit/colors.dart';

class RespectBadge extends StatelessWidget {
  final int respectsCount;

  const RespectBadge({Key? key, required this.respectsCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(CupertinoIcons.hand_thumbsup, color: TColors.black, size: 20),
              const SizedBox(width: 6),
              Text('Похвалить', style: TTypography.caption2.copyWith(color: TColors.black),),
            ],
          ),
        ),
      ),
    );
  }
}
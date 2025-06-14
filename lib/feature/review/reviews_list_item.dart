import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tochki/core/dto/review_dto.dart';
import 'package:tochki/feature/review/view.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../shared/ui_kit/typography.dart';

class ReviewsListItem extends StatelessWidget {
  final ReviewDTO review;

  const ReviewsListItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(review.title, style: TTypography.headline2, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(review.body, style: TTypography.body2, maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: IconButton(
        icon: const Icon(CupertinoIcons.chevron_right),
        onPressed: () => Get.to(() => Review(review: review)),
      ),
    );
  }
}

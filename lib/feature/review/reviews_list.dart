import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tochki/feature/review/reviews_list_controller.dart';
import 'package:tochki/feature/review/reviews_list_item.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../shared/ui_kit/colors.dart';
import '../../../shared/ui_kit/spacers.dart';
import '../../../shared/ui_kit/typography.dart';

class ReviewsList extends GetView<ReviewsListController> {
  final int placeId;

  const ReviewsList({super.key, required this.placeId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewsListController(placeId: placeId));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.black,
        title: Text(
          'Рецензии на точку',
          style: TTypography.headline2.copyWith(color: TColors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_sharp,
            color: TColors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.reviews.isEmpty) {
          return Center(
            child: Text(
              'Нет рецензий на эту точку',
              style: TTypography.headline2,
              textAlign: TextAlign.center,
            ),
          );
        }
        return SingleChildScrollView(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: controller.reviews.length,
            itemBuilder: (context, index) => ReviewsListItem(review: controller.reviews[index]),
            separatorBuilder: (context, index) => SizedBox(width: TSpacers.spacing3),
          ),
        );
      }),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(TSpacers.spacing3),
        child: UiButton.filledPrimary(
          onPressed: () {
            // Get.find<AuthController>().guestMode ? TSnackbar.show(context,'Для добавления рецензии необходимо авторизоваться') : Get.to(() => ReviewForm(placeId: placeId));;
          },
          label: Icon(CupertinoIcons.add, color: TColors.white,),
        ),
      ),
    );
  }
}

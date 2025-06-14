import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tochki/shared/ui_kit/ui_kit.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../core/dto/review_dto.dart';
import '../authorization/controller.dart';
import '../user_profile/modal.dart';

class Review extends GetView<ReviewController> {
  final ReviewDTO review;

  const Review({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    Get.put(ReviewController(review: review));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.black,
        title: Text(
          'Рецензия',
          style: TTypography.headline2.copyWith(color: TColors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: TColors.white,
          ),
          onPressed: () => Get.back(),
        ),
        // actions: [DistanceBadge(distance: '2,3km')],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PhotosRow(imageUrls: imageUrls),
            Padding(
              padding: const EdgeInsets.fromLTRB(TSpacers.spacing5, TSpacers.spacing4, TSpacers.spacing5, TSpacers.spacing5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.title,
                    style: TTypography.promo,
                  ),
                  /// get to place page from its review
                  // Row(
                  //   children: [
                  //     Text('Точка: '),
                  //     GestureDetector(
                  //       child: Text(
                  //         '${controller.getReviewPlaceName()} ❯',
                  //         style: TTypography.body3,
                  //       ),
                  //       onTap: () async {
                  //         Get.to(() => Place(id: 7,));
                  //       },
                  //     )
                  //   ],
                  // ),
                  SizedBox(height: TSpacers.spacing5,),
                  Text(
                    review.body,
                    style: TTypography.body2,
                  ),
                  SizedBox(
                    height: TSpacers.spacing5,
                  ),
                  // VoteButton.loading(),
                  SizedBox(
                    height: TSpacers.spacing5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Написал '),
                          GestureDetector(
                            child: Obx(() => Text(
                              '${controller.authorName.value} ❯',
                              style: TTypography.body3,
                            )),
                            onTap: () {
                              UserProfile(
                                id: review.authorId,
                                name: controller.authorName.value,
                              ).showModal(context);
                            },
                          )
                        ],
                      ),
                      Text(
                        DateFormat('d MMMM yyyy', 'ru').format(
                            review.createdAt),
                        style: TTypography.body3,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: TSpacers.spacing5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: review.id.toString()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ReviewID: ${review.id.toString()}',
                          style:
                              TTypography.caption2.copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          width: TSpacers.spacing2,
                        ),
                        Icon(
                          Icons.copy_rounded,
                          color: Colors.grey,
                          size: TSpacers.spacing4,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReviewController extends GetxController {
  final ReviewDTO review;
  final RxString authorName = ''.obs;

  ReviewController({required this.review});

  @override
  onInit() async {
    super.onInit();
    authorName.value = await Get.find<AuthController>().getUsernameById(review.authorId) ?? 'пользователь';
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tochki/feature/user_profile/widgets/user_profile_menu.dart';
import 'package:tochki/shared/ui_kit/ui_kit.dart';

import 'package:ui_kit/ui_kit.dart';

import 'controller.dart';

class UserProfile {
  final controller = Get.put(UserProfileController());

  final String id;
  final String name;

  UserProfile({required this.id, required this.name}) {
    controller.id.value = id;
  }

  void showModal(BuildContext context) {
    TModal.showTModal(
      context,
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TTypography.promo.copyWith(color: TColors.white),
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //       'Зарегистрирован',
                  //       style:
                  //           TTypography.caption2.copyWith(color: Colors.white),
                  //     ),
                  //     controller.registrationDate.value == ''
                  //         ? TShimmers.sizedShimmer(TTypography.caption2)
                  //         : Text(
                  //             '01 авг 2025',
                  //             style: TTypography.caption2
                  //                 .copyWith(color: Colors.white),
                  //           ),
                  //   ],
                  // )
                ],
              ),
              // Divider(color: TColors.white,),
              SizedBox(
                height: TSpacers.spacing3,
              ),
              Obx(
                () => UserProfileMenu(
                  pointsCount: controller.pointsCount.value,
                  reviewsCount: controller.reviewsCount.value,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

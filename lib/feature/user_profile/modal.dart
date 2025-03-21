import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tochki/feature/user_profile/widgets/user_profile_menu.dart';
import 'package:tochki/shared/ui_kit/ui_kit.dart';

import 'package:ui_kit/ui_kit.dart';

class UserProfile {
  // final WikimapiaController controller = Get.put(WikimapiaController());

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
                    Text('Dim4', style: TTypography.promo.copyWith(color: TColors.white),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Зарегистрирован', style: TTypography.caption2.copyWith(color: Colors.white),),
                        Text('01 авг 2025', style: TTypography.caption2.copyWith(color: Colors.white),),
                      ],
                    )
                  ],
                ),
                // Divider(color: TColors.white,),
                SizedBox(height: TSpacers.spacing3,),
                UserProfileMenu(
                  userID: 1,
                  pointsCount: 10,
                  reviewsCount: 5,
                ),
                GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: 'sampleid'));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('UserID: 1', style: TTypography.caption2.copyWith(color: Colors.grey),),
                      SizedBox(width: TSpacers.spacing2,),
                      Icon(Icons.copy_sharp, color: Colors.grey, size: TSpacers.spacing4,)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
    );
  }
}

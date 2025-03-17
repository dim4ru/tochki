import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tochki/feature/user_profile/widgets/user_profile_menu.dart';
import 'package:tochki/shared/ui_kit/colors.dart';
import 'package:tochki/shared/ui_kit/spacers.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../shared/ui_kit/typography.dart';

class UserProfile extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.black,
        title: Text('dim4', style: TTypography.headline2.copyWith(color: TColors.white),),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: TColors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(TSpacers.spacing5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: TSpacers.spacing3,),
                  UserProfileMenu(
                    userID: 1,
                    pointsCount: 10,
                    reviewsCount: 5,
                  ),
                  Column(
                    children: [
                      SizedBox(height: TSpacers.spacing3,),
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
                  ),
                  SizedBox(height: TSpacers.spacing5,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
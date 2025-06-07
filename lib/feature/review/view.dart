import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tochki/feature/place/view.dart';
import 'package:tochki/feature/place/widgets/photos_row.dart';
import 'package:tochki/shared/routing/routes.dart';
import 'package:tochki/shared/ui_kit/ui_kit.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../mock.dart';
import '../../shared/ui_kit/rating_buttons/vote_button.dart';

class Review extends GetView {
  @override
  Widget build(BuildContext context) {
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
            PhotosRow(imageUrls: imageUrls),
            Padding(
              padding: const EdgeInsets.fromLTRB(TSpacers.spacing5, TSpacers.spacing4, TSpacers.spacing5, TSpacers.spacing5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Очень крутая атмосфера',
                    style: TTypography.promo,
                  ),
                  Row(
                    children: [
                      Text('Точка: '),
                      GestureDetector(
                        child: Text(
                          'Гаупвахта ❯',
                          style: TTypography.body3,
                        ),
                        onTap: () async {
                          // todo get by point id
                          Get.to(() => Place(id: 7,));
                        },
                      )
                    ],
                  ),
                  SizedBox(height: TSpacers.spacing5,),
                  Text(
                    loremXS,
                    style: TTypography.body2,
                  ),
                  SizedBox(
                    height: TSpacers.spacing5,
                  ),
                  VoteButton.loading(),
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
                            child: Text(
                              'dim4 ❯',
                              style: TTypography.body3,
                            ),
                            onTap: () {
                              Get.toNamed(TRoutes.userProfile);
                            },
                          )
                        ],
                      ),
                      Text('6 марта 2025'),
                    ],
                  ),
                  SizedBox(
                    height: TSpacers.spacing5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: 'sampleid'));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ReviewID: 9634',
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

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tochki/feature/place/widgets/distance_badge.dart';
import 'package:tochki/feature/place/widgets/photos_row.dart';
import 'package:tochki/feature/place/widgets/place_stats_row.dart';
import 'package:tochki/shared/routing/routes.dart';
import 'package:tochki/shared/ui_kit/ui_kit.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../data/mock.dart';

class Place extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.black,
        title: Text('Точка', style: TTypography.headline2.copyWith(color: TColors.white),),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: TColors.white,
          ),
          onPressed: () => Get.back(),
        ),
        actions: [DistanceBadge(distance: '2,3km')],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhotosRow(imageUrls: imageUrls),
            Padding(
              padding: const EdgeInsets.all(TSpacers.spacing5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Very-very long place name',
                    style: TTypography.promo,
                  ),
                  PlaceStatsRow(
                    rating: 67.0,
                    visited: 14,
                    reviewsCount: 3,
                  ),
                  Text(
                    loremXS,
                    style: TTypography.body2,
                  ),
                  SizedBox(
                    height: TSpacers.spacing3,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // TODO open wikimapia description modal
                    },
                    child: Text('Описание из Wikimapia  ❯', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: TSpacers.spacing5,),
                  SizedBox(
                    width: double.infinity,
                    child: UiButton.filledPrimary(
                      onPressed: (){},
                      label: Text('Я здесь был', style: TTypography.body3,),
                    ),
                  ),
                  SizedBox(height: TSpacers.spacing5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Добавил '),
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
                  SizedBox(height: TSpacers.spacing5,),
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: 'sampleid'));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('PointID: 9634', style: TTypography.caption2.copyWith(color: Colors.grey),),
                        SizedBox(width: TSpacers.spacing2,),
                        Icon(Icons.copy_sharp, color: Colors.grey, size: TSpacers.spacing4,)
                      ],
                    ),
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
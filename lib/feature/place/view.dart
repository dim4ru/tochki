import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tochki/feature/place/widgets/distance_badge.dart';
import 'package:tochki/feature/place/widgets/photos_row.dart';
import 'package:tochki/feature/place/widgets/place_stats_row.dart';
import 'package:tochki/shared/spacers.dart';
import 'package:tochki/shared/typography.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../data/mock.dart';

class Place extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Точка'),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
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
                    'Place name',
                    style: TTypography.promo,
                  ),
                  PlaceStatsRow(
                    rating: 67.0,
                    visited: 14,
                    author: 'dim4',
                    reviewsCount: 3,
                  ),
                  Text(
                    loremS,
                    style: TTypography.body2,
                  ),
                  SizedBox(height: TSpacers.spacing5,),
                  SizedBox(
                    width: double.infinity,
                    child: UiButton.filledPrimary(
                      onPressed: (){},
                      label: Text('Я здесь был', style: TTypography.body3,),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
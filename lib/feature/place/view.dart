import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tochki/feature/place/controller.dart';
import 'package:tochki/feature/place/widgets/distance_badge.dart';
import 'package:tochki/feature/place/widgets/photos_row.dart';
import 'package:tochki/feature/place/widgets/place_stats_row.dart';
import 'package:tochki/shared/ui_kit/rating_buttons/was_here_button.dart';
import 'package:tochki/shared/ui_kit/ui_kit.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../mock.dart';
import '../user_profile/modal.dart';
import '../wikimapia/modal.dart';

class Place extends GetView<PlaceController> {
  final int id;

  Place({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(PlaceController(placeId: id));

    return Obx(() => controller.place.value == null ? CircularProgressIndicator() : Scaffold(
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
            PhotosRow(imageUrls: imageUrls, uploadButton: true, showAllButton: true,),
            Padding(
              padding: const EdgeInsets.all(TSpacers.spacing5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.place.value!.name,
                    style: TTypography.promo,
                  ),
                  PlaceStatsRow(
                    rating: 67.0,
                    visited: 14,
                    reviewsCount: 3,
                  ),
                  Text(
                    controller.place.value!.description,
                    style: TTypography.body2,
                  ),
                  SizedBox(
                    height: TSpacers.spacing3,
                  ),
                  GestureDetector(
                    onTap: () async {
                      WikimapiaModal().showModal(context, controller.place.value?.latitude, controller.place.value?.longitude);
                    },
                    child: Text('Описание из Wikimapia  ❯', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: TSpacers.spacing5,),
                  WasHereButton(name: 'dim4'),
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
                              UserProfile().showModal(context);
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
                        Text('PointID: $id', style: TTypography.caption2.copyWith(color: Colors.grey),),
                        SizedBox(width: TSpacers.spacing2,),
                        Icon(Icons.copy_rounded, color: Colors.grey, size: TSpacers.spacing4,)
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
    ));
  }
}
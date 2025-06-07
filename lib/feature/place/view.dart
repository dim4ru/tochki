import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tochki/feature/place/controller.dart';
import 'package:tochki/feature/place/widgets/distance_badge.dart';
import 'package:tochki/feature/place/widgets/photos_row.dart';
import 'package:tochki/feature/place/widgets/place_stats_row.dart';
import 'package:tochki/shared/ui_kit/ui_kit.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../mock.dart';
import '../../shared/ui_kit/snackbar.dart';
import '../review/controller.dart';
import '../user_profile/modal.dart';
import '../wikimapia/modal.dart';
import 'form/form.dart';

class Place extends GetView<PlaceController> {
  final int id;

  Place({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(PlaceController(placeId: id));
    Get.put(ReviewController(reviewId: 1));

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
        actions: [DistanceBadge(placeLatitude: controller.place.value!.latitude, placeLongitude: controller.place.value!.longitude)],
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
                    rating: controller.place.value?.rating?.toDouble(),
                    visited: controller.place.value?.visitorCount ?? 0,
                    reviewsCount: controller.place.value?.reviewsCount ?? 0,
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
                  SizedBox(
                    height: TSpacers.spacing3,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Get.to(() => PlaceForm(
                        formType: FormType.edit,
                      ));
                    },
                    child: Text('Править точку  ❯', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: TSpacers.spacing5,),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: UiButton.filledPrimary(
                  //     enabled: !controller.isVisited.value,
                  //     onPressed: (){
                  //       controller.registerVisit();
                  //       TSnackbar.show(context, 'Вы здесь были');
                  //     },
                  //     label: Text('Здесь был dim4', style: TTypography.body3,),
                  //   ),
                  // ),
                  SizedBox(
                    width: double.infinity,
                    child:
                    !controller.isVisited.value ?
                    UiButton.filledPrimary(
                      onPressed: (){
                        controller.registerVisit();
                        TSnackbar.show(context, 'Вы отметились на этой точке!');
                      },
                      label: Text('Здесь был dim4', style: TTypography.body3,),
                    ) :
                    UiButton.filledSecondary(
                      onPressed: (){},
                      label: Text('Вы здесь уже были', style: TTypography.body4,),
                    )
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
                              UserProfile().showModal(context);
                            },
                          )
                        ],
                      ),
                      Text(
                        controller.place.value?.createdAt != null
                            ? DateFormat('d MMMM yyyy', 'ru')
                            .format(controller.place.value!.createdAt!)
                            : '',
                        style: TTypography.body3,
                      ),                    ],
                  ),
                  SizedBox(height: TSpacers.spacing5,),
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: controller.placeId.toString()));
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
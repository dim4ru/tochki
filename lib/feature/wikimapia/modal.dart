import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tochki/feature/wikimapia/place_view.dart';
import 'package:tochki/shared/ui_kit/ui_kit.dart';

import 'cotroller.dart';

class WikimapiaModal {
  final WikimapiaController controller = Get.put(WikimapiaController());

  void showModal(BuildContext context, lat, lon) {
    TModal.showTModal(
        context,
        Obx(() => AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: (controller.place.value != null)
                  ? WikimapiaPlaceView(
                      placeDto: controller.place.value!,
                      onBackPressed: () {
                        controller.place.value =
                            null; // Сбрасываем place в null
                      })
                  : Container(
                      clipBehavior: Clip.none,
                      padding: EdgeInsets.all(TSpacers.spacing5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Поиск точки на Wikimapia',
                            style: TTypography.headline1
                                .copyWith(color: TColors.white),
                          ),
                          SizedBox(
                            height: TSpacers.spacing3,
                          ),
                          Text(
                            'Выберите наиболее соответствующее место из результатов поиска по локации точки, отсортированных по убыванию удаленности',
                            style: TTypography.caption2
                                .copyWith(color: TColors.white),
                          ),
                          SizedBox(height: TSpacers.spacing3),
                          Obx(() {
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: controller.isLoading.value
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: TSpacers.spacing5),
                                      child: Center(child: TCircularLoader()),
                                    )
                                  : controller.placesNearest.isEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: TSpacers.spacing5),
                                          child: Center(
                                            child: Text(
                                              'Нет результатов',
                                              style: TTypography.body2.copyWith(
                                                  color: TColors.white),
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              controller.placesNearest.length,
                                          itemBuilder: (context, index) {
                                            final place =
                                                controller.placesNearest[index];
                                            return SizedBox(
                                              width: double.infinity,
                                              child: ListTile(
                                                onTap: () => controller
                                                    .getWikimapiaPlace(
                                                        controller
                                                            .placesNearest[
                                                                index]
                                                            .id
                                                            .toString()),
                                                contentPadding: EdgeInsets.zero,
                                                title: Text(
                                                  place.title,
                                                  style: TTypography.body2
                                                      .copyWith(
                                                          color: TColors.white),
                                                ),
                                                trailing: const Icon(Icons
                                                    .chevron_right_outlined),
                                              ),
                                            );
                                          }),
                            );
                          }),
                          SizedBox(
                              height: MediaQuery.of(context).padding.bottom),
                        ],
                      ),
                    ),
            )));
  }
}

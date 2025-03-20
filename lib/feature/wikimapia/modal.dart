import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tochki/shared/ui_kit/ui_kit.dart';

import '../../shared/ui_kit/colors.dart';

class WikimapiaModal {
  final WikimapiaController controller = Get.put(WikimapiaController());

  void showModal(BuildContext context, lat, lon) {
    TModal.showTModal(
        context,
        Container(
          clipBehavior: Clip.none,
          padding: EdgeInsets.all(TSpacers.spacing5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Поиск точки на Wikimapia',
                style: TTypography.headline1.copyWith(color: TColors.white),
              ),
              SizedBox(
                height: TSpacers.spacing3,
              ),
              Text(
                'Выберите наиболее соответствующее место из результатов поиска по локации точки, отсортированных по убыванию удаленности',
                style: TTypography.caption2.copyWith(color: TColors.white),
              ),
              SizedBox(height: TSpacers.spacing3),
              Obx(() {

                if (controller.isLoading.value) {
                  return Padding(
                    padding: const EdgeInsets.only(top: TSpacers.spacing5),
                    child: Center(child: TCircularLoader()),
                  );
                } else if (controller.places.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: TSpacers.spacing5),
                    child: Center(
                        child: Text(
                      'Нет результатов',
                      style: TTypography.body2.copyWith(color: TColors.white),
                    )),
                  );
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.places.length,
                      itemBuilder: (context, index) {
                        final place = controller.places[index];
                        return SizedBox(
                          width: double.infinity,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              place.title,
                              style: TTypography.body2
                                  .copyWith(color: TColors.white),
                            ),
                            trailing: const Icon(Icons.chevron_right_outlined),
                          ),
                        );
                      });
                }
              }),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ));
  }
}

class WikimapiaController extends GetxController {
  var isLoading = false.obs;
  var places = <Place>[].obs;

  // Симуляция запроса на сервер (например, с использованием Dio и Retrofit)
  void fetchPlaces() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2)); // Симуляция задержки
    places.value = [
      // Place(title: 'Красная площадь'),
      // Place(title: 'Эйфелева башня'),
      // Place(title: 'Статуя Свободы'),
      // Place(title: 'Статуя Свободы'),
      // Place(title: 'Статуя Свободы'),
    ];
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    fetchPlaces();
  }
}

class Place {
  final String title;

  Place({required this.title});
}

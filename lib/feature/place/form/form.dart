import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tochki/feature/place/widgets/photos_row.dart';
import 'package:tochki/shared/ui_kit/text_field.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../mock.dart';
import '../../../shared/ui_kit/snackbar.dart';
import '../../../shared/ui_kit/ui_kit.dart';
import '../edits_history/place_edits_list.dart';
import 'controller.dart';
import 'location_picker.dart';

enum FormType {
  create,
  edit,
}

class PlaceForm extends GetView<PlaceFormController> {
  final FormType formType;
  final LatLng initialLocation;

  PlaceForm({Key? key, required this.formType, required this.initialLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PlaceFormController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.black,
        title: Text(
          formType == FormType.create ? 'Создание точки' : 'Правка точки',
          style: TTypography.headline2.copyWith(color: TColors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.cancel_outlined,
            color: TColors.white,
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          if (formType == FormType.edit)
          IconButton(
              onPressed: () {
                Get.to(
                  PlaceEditsList(),
                );
              },
              icon: Icon(
                Icons.history_sharp,
                color: TColors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // photos added via separate button,
            // in edit mode can only be deleted
            if (formType == FormType.edit)
            PhotosRow(
              imageUrls: imageUrls,
              uploadButton: true,
            ),
            Padding(
              padding: const EdgeInsets.all(TSpacers.spacing5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Координаты точки',
                            style: TTypography.caption2,
                          ),
                          SizedBox(
                            height: TSpacers.spacing3,
                          ),

                          /// 1.КООРДИНАТЫ
                          GestureDetector(
                            onTap: () async {
                              await Clipboard.setData(ClipboardData(
                                  text: controller.location.value
                                          ?.toFormattedString() ??
                                      initialLocation.toFormattedString()));
                              TSnackbar.show(
                                context,
                                'Координаты скопированы в буфер обмена',
                              );
                            },
                            child: Row(
                              children: [
                                Obx(() => Text(
                                      controller.location.value
                                              ?.toFormattedString() ??
                                          initialLocation.toFormattedString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(
                                  width: TSpacers.spacing3,
                                ),
                                Icon(Icons.copy_sharp, size: TSpacers.spacing5),
                              ],
                            ),
                          ),
                        ],
                      ),
                      UiButton.filledPrimary(
                        onPressed: () async {
                          final LatLng? picked = await Get.to<LatLng>(
                            () => LocationPicker(initialCenter: initialLocation,),
                          );

                          if (picked != null) {
                            controller.location.value = picked;
                          }
                        },
                        icon: Icon(Icons.pin_drop_outlined),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: TSpacers.spacing5,
                  ),

                  // TODO placeholder max symbols
                  Text(
                    'Название (заголовок) точки',
                    style: TTypography.caption2,
                  ),
                  SizedBox(
                    height: TSpacers.spacing3,
                  ),

                  /// 2.НАЗВАНИЕ
                  UiTextField.standard(
                    controller: controller.pointNameFieldController,
                  ),
                  SizedBox(
                    height: TSpacers.spacing5,
                  ),
                  Text(
                    'Подробное описание места (для отзыва – есть рецензия)',
                    style: TTypography.caption2,
                  ),
                  SizedBox(
                    height: TSpacers.spacing3,
                  ),

                  /// 3.ОПИСАНИЕ
                  SimpleUiTextField(
                    hintText: 'Не более 2000 символов',
                    variant: UiTextFieldVariant.long,
                    controller: controller.descriptionFieldController,
                  ),
                  SizedBox(
                    height: TSpacers.spacing5,
                  ),
                  // TODO placeholder max symbols
                  if (formType == FormType.edit)
                  Column(
                    children: [
                      Text(
                        'Краткое описание правки (отображается в истории правок)',
                        style: TTypography.caption2,
                      ),
                      SizedBox(
                        height: TSpacers.spacing3,
                      ),
                      /// 4.ПРАВКА
                      UiTextField.standard(
                        controller: controller.editCommentFieldController,
                      ),
                      SizedBox(
                        height: TSpacers.spacing5,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: UiButton.filledPrimary(
                      onPressed: () async {
                        if (formType == FormType.create) {
                          await controller.createPlace();
                          Get.back();
                        }
                        if (formType == FormType.edit) {
                          await controller.editPlace();
                          Get.back();
                        }
                      },
                      label: Text(
                        formType == FormType.create ? 'Создать точку' : 'Применить правки',
                        style: TTypography.body3,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: TSpacers.spacing3,
                  ),
                  if (formType == FormType.edit)
                  GestureDetector(
                    onTap: () async {
                      Get.to(
                        PlaceEditsList(),
                      );
                    },
                    child: Text('История правок  ❯',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: TSpacers.spacing5,
                  ),
                  if (formType == FormType.edit)
                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: 'sampleid'));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PointID: 9634',
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

extension LatLngFormatting on LatLng {
  /// Возвращает строку "xx.xxxxxx, yy.yyyyyy"
  String toFormattedString() {
    return '${latitude.toStringAsFixed(6)}, ${longitude.toStringAsFixed(6)}';
  }
}

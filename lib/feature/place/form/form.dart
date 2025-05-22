import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tochki/feature/place/widgets/photos_row.dart';
import 'package:tochki/shared/ui_kit/text_field.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../mock.dart';
import '../../../shared/ui_kit/ui_kit.dart';

class PlaceForm extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.black,
        title: Text('Правка точки', style: TTypography.headline2.copyWith(color: TColors.white),),
        leading: IconButton(
          icon: Icon(
            Icons.cancel_outlined,
            color: TColors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhotosRow(imageUrls: imageUrls, uploadButton: true,),
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
                          SizedBox(height: TSpacers.spacing3,),
                          GestureDetector(
                            onTap: () async {
                              await Clipboard.setData(ClipboardData(text: 'sampleid'));
                            },
                            child: Row(
                              children: [
                                Text('55.125995, 48.225100',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(width: TSpacers.spacing3,),
                                Icon(Icons.copy_sharp, size: TSpacers.spacing5),
                              ],
                            ),
                          ),
                        ],
                      ),
                      UiButton.filledPrimary(
                        onPressed: () {
                        },
                        icon: Icon(Icons.pin_drop_outlined),
                      ),
                    ],
                  ),
                  SizedBox(height: TSpacers.spacing5,),
                  // TODO placeholder max symbols
                  Text(
                    'Название (заголовок) точки',
                    style: TTypography.caption2,
                  ),
                  SizedBox(height: TSpacers.spacing3,),
                  UiTextField.standard(

                  ),
                  SizedBox(height: TSpacers.spacing5,),
                  Text(
                    'Подробное описание места (для отзыва – есть рецензия)',
                    style: TTypography.caption2,
                  ),
                  SizedBox(height: TSpacers.spacing3,),
                  SimpleUiTextField(
                    hintText: 'Не более 2000 символов',
                    variant: UiTextFieldVariant.long,
                  ),
                  SizedBox(height: TSpacers.spacing5,),
                  // TODO placeholder max symbols
                  Text(
                    'Краткое описание правки (отображается в истории правок)',
                    style: TTypography.caption2,
                  ),
                  SizedBox(height: TSpacers.spacing3,),
                  UiTextField.standard(

                  ),
                  SizedBox(height: TSpacers.spacing5,),
                  SizedBox(
                    width: double.infinity,
                    child: UiButton.filledPrimary(
                      onPressed: (){},
                      label: Text('Применить правки', style: TTypography.body3,),
                    ),
                  ),
                  SizedBox(height: TSpacers.spacing3,),
                  GestureDetector(
                    onTap: () async {
                      Get.to(() => PlaceForm());
                    },
                    child: Text('История правок  ❯', style: TextStyle(fontWeight: FontWeight.bold)),
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
    );
  }
}
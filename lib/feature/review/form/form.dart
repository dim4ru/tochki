import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tochki/shared/ui_kit/text_field.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../shared/ui_kit/ui_kit.dart';
import 'controller.dart';

class ReviewForm extends StatelessWidget {
  final int placeId;

  ReviewForm({
    super.key, required this.placeId,
  }) {
    Get.put(ReviewFormController(placeId: placeId));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ReviewFormController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.black,
        title: Text(
          'Создание рецензии',
          style: TTypography.headline2.copyWith(color: TColors.white),
        ),
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
            Padding(
              padding: const EdgeInsets.all(TSpacers.spacing5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO placeholder max symbols
                  Text (
                    'Заголовок рецензии (желательно цепляюищй)',
                    style: TTypography.caption2,
                  ),
                  SizedBox(
                    height: TSpacers.spacing3,
                  ),

                  /// 1.НАЗВАНИЕ
                  UiTextField.standard(
                    controller: controller.reviewTitleFieldController,
                  ),
                  SizedBox(
                    height: TSpacers.spacing5,
                  ),
                  Text(
                    'Подробная рецензия, например, история посещения, впечатления, советы',
                    style: TTypography.caption2,
                  ),
                  SizedBox(
                    height: TSpacers.spacing3,
                  ),

                  /// 2.ОПИСАНИЕ
                  SimpleUiTextField(
                    hintText: 'Не более 2000 символов',
                    variant: UiTextFieldVariant.long,
                    controller: controller.reviewBodyFieldController,
                  ),
                  SizedBox(
                    height: TSpacers.spacing5,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: UiButton.filledPrimary(
                      onPressed: () async {
                        await controller.createReview();
                        Get.back();
                        // TSnackbar.show(context, 'Рецензия на точку опубликована');
                      },
                      label: Text(
                        'Опубликовать',
                        style: TTypography.body3,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: TSpacers.spacing3,
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
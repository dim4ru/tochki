import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tochki/feature/place/edits_history/place_edits_list_item.dart';

import '../../../shared/ui_kit/colors.dart';
import '../../../shared/ui_kit/spacers.dart';
import '../../../shared/ui_kit/typography.dart';
import 'place_edits_list_controller.dart';

class PlaceEditsList extends GetView<PlaceEditsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.black,
        title: Text(
          'История правок',
          style: TTypography.headline2.copyWith(color: TColors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_sharp,
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
                child: Text(
                  'Выбранная версия точки будет отображаться вместо текущей',
                  style: TTypography.headline2,
                )),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PlaceEditsListItem(edit: controller.edits[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: TSpacers.spacing3);
                },
                itemCount: controller.edits.length),
          ],
        ),
      ),
    );
  }
}

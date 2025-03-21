import 'package:flutter/material.dart';
import 'package:tochki/core/dto/wikimapia_place_by_id_result_dto.dart';

import '../../shared/ui_kit/ui_kit.dart';

class WikimapiaPlaceView extends StatelessWidget {
  final WikimapiaPlaceByIdResultDto placeDto;

  const WikimapiaPlaceView({super.key, required this.placeDto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(TSpacers.spacing5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            placeDto.title.isNotEmpty ? placeDto.title : "Без названия",
            style: TTypography.headline1.copyWith(color: TColors.white),
          ),
          SizedBox(
            height: TSpacers.spacing3,
          ),
          Text(
            placeDto.description.isNotEmpty ? placeDto.description : "Нет описания",
            style: TTypography.body2.copyWith(color: TColors.white),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}

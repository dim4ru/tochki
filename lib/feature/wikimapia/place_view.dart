import 'package:flutter/material.dart';
import 'package:tochki/core/dto/wikimapia_place_by_id_result_dto.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/ui_kit/ui_kit.dart';

class WikimapiaPlaceView extends StatelessWidget {
  final WikimapiaPlaceByIdResultDto placeDto;
  final VoidCallback? onBackPressed;

  const WikimapiaPlaceView({
    super.key,
    required this.placeDto,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          height: TSpacers.spacing5,
        ),
        Row(
          children: [
            UiButton.filledSecondary(
              iconAlignment: IconAlignment.end,
              icon: Icon(Icons.arrow_back_rounded, color: TColors.black,),
              onPressed: onBackPressed,
            ),
            SizedBox(width: TSpacers.spacing3,),
            if (placeDto.url != '')
            Expanded(
              child: UiButton.filledSecondary(
                iconAlignment: IconAlignment.end,
                icon: Icon(Icons.open_in_browser, color: TColors.black,),
                onPressed: () async {
                  final Uri url = Uri.parse(placeDto.url);
                  await launchUrl(url);
                },
                label: Text('Подробнее на wikimapia.org', style: TTypography.body4,),
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom),
      ],
    );
  }
}

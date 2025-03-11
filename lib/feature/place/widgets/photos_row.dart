import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:tochki/shared/shimmers.dart';
import 'package:tochki/shared/spacers.dart';
import 'package:tochki/shared/typography.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../shared/colors.dart';

class PhotosRow extends StatelessWidget {
  const PhotosRow({super.key, required this.imageUrls});

  final imageUrls;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: TSpacers.spacing2,
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  color: TColors.black,
                  width: MediaQuery.sizeOf(context).width * 0.15,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_a_photo_outlined,
                      color: TColors.white,
                    ),
                  ),
                );
              }
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedNetworkImage(
                  imageUrl: imageUrls[index],
                  placeholder: (context, url) => TShimmers.imageShimmer,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: TSpacers.spacing2);
            },
          ),
        ),
        SizedBox(height: TSpacers.spacing2),
        Container(
          color: TColors.black,
          height: MediaQuery.sizeOf(context).width * 0.08,
          width: double.infinity,
          child: UiButton.text(
            onPressed: () {},
            label: Text(
              'Все фото (9)',
              style: TTypography.caption1.copyWith(color: TColors.white),
            ),
          ),
        ),
      ],
    );
  }
}

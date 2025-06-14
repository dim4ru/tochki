import 'package:flutter/cupertino.dart';
import 'package:tochki/shared/ui_kit/typography.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../shared/ui_kit/ui_kit.dart';

class UserProfileMenu extends StatelessWidget {
  final int pointsCount;
  final int reviewsCount;
  final int photosCount;

  const UserProfileMenu({
    super.key,
    required this.pointsCount,
    required this.reviewsCount,
    required this.photosCount,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = TTypography.body1.copyWith(color: TColors.white);

    final menuItems = [
      ListTile(
        // leading: Icon(Icons.pin_drop_outlined, color: TColors.white,),
        title: Text('Добавлено точек – $pointsCount',style: titleStyle,),
        // trailing: Icon(Icons.chevron_right_outlined, color: TColors.white,),
      ),
      ListTile(
        // leading: Icon(Icons.rate_review_outlined, color: TColors.white,),
        title: Text('Добавлено рецензий – $reviewsCount', style: titleStyle,),
        // trailing: Icon(Icons.chevron_right_outlined, color: TColors.white,),
      ),
      ListTile(
        title: Text('Добавлено фотографий – $photosCount', style: titleStyle,),
      ),
    ];

    return SizedBox(
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: menuItems.length,
        itemBuilder: (context, index) => menuItems[index],
      ),
    );
  }
}
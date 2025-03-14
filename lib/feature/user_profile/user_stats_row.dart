import 'package:flutter/cupertino.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../shared/ui_kit/spacers.dart';

class UserStatsRow extends StatelessWidget {
  final double rating;
  final int visitors;

  const UserStatsRow({
    super.key,
    required this.rating,
    required this.visitors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TSpacers.spacing9,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Процент одобрения точек, добавленных пользователем
            UiButton.text(onPressed: (){}, label: Text("${rating.toStringAsFixed(0)}% одобрения"), icon: Icon(Icons.thumbs_up_down_outlined),),
            // Количество посещений точек, добавленных пользователем
            UiButton.text(onPressed: (){}, label: Text(visitors.toString() + " посетителей"), icon: Icon(CupertinoIcons.person_2),),
          ],
        ),
      ),
    );
  }
}
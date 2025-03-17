import 'package:flutter/cupertino.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../shared/ui_kit/spacers.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  // Процент одобрения точек, добавленных пользователем
                  TextSpan(
                    text: "${rating.toStringAsFixed(0)}%",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " – рейтинг добавленных точек"),
                ],
              ),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: visitors.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold)),
              // Количество посещений точек, добавленных пользователем
              TextSpan(text: " – человек посетило добавленные точки")
            ])),
          ],
        ),
      ),
    );
  }
}

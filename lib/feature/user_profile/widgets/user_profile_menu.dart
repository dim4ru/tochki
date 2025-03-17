import 'package:flutter/cupertino.dart';
import 'package:ui_kit/ui_kit.dart';

class UserProfileMenu extends StatelessWidget {
  final int userID;
  final int pointsCount;
  final int reviewsCount;

  const UserProfileMenu({
    super.key,
    required this.userID,
    required this.pointsCount,
    required this.reviewsCount,
  });

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      ListTile(
        leading: Icon(Icons.pin_drop_outlined),
        title: Text('Точки ($pointsCount)'),
        trailing: Icon(Icons.chevron_right_outlined),
      ),
      ListTile(
        leading: Icon(Icons.rate_review_outlined),
        title: Text('Рецензии ($reviewsCount)'),
        trailing: Icon(Icons.chevron_right_outlined),
      ),
    ];

    return SizedBox(
      width: double.infinity,
      child: ListView.separated(
        shrinkWrap: true, // Позволяет списку адаптироваться по высоте контента
        physics: NeverScrollableScrollPhysics(), // Отключает скролл внутри ListView
        itemCount: menuItems.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => menuItems[index],
      ),
    );
  }
}
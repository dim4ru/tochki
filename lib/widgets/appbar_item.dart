import 'package:flutter/cupertino.dart';

import '../models/appbar_tabs.dart';

class AppBarItem extends StatelessWidget {
  final AppBarTab item;

  const AppBarItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Text(
      item.title
    );
  }
}
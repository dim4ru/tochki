import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class AppBarItem extends StatelessWidget {
  final AppBarTab item;

  const AppBarItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Text(
        item.title,
      ),
    );
  }
}
import 'package:flutter/material.dart';

class PlaceEditsListItem extends StatelessWidget {
  final String edit;

  const PlaceEditsListItem({super.key, required this.edit});

  @override
  Widget build(BuildContext context) {
    return Text(edit);
  }
}

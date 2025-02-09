import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DistanceBadge extends StatelessWidget {
  final String distance;

  const DistanceBadge({Key? key, required this.distance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(CupertinoIcons.arrow_turn_up_right, color: Colors.blue, size: 20),
              const SizedBox(width: 6),
              Text(distance,),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tochki/feature/place/widgets/distance_badge.dart';
import 'package:tochki/feature/place/widgets/photos_row.dart';
import 'package:tochki/shared/typography.dart';

import '../../data/mock.dart';

class Place extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Крутое место'),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
          ),
          onPressed: () => Get.back(),
        ),
        actions: [DistanceBadge(distance: '2,3km')],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhotosRow(imageUrls: imageUrls),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Place name',
                    style: TTypography.promo,
                  ),
                  Text(
                    loremS,
                    style: TTypography.body2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tochki/feature/place/widgets/distance_badge.dart';

class Place extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Крутое место'),
        leading: IconButton(
          icon: Icon(Icons.close,),
          onPressed: () => Get.back(),
        ),
        actions: [
          DistanceBadge(distance: '2,3km')
        ],
      ),
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
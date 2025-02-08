import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tochki/feature/map/controller.dart';
import 'package:tochki/feature/map/view.dart';
import 'package:tochki/feature/navigation/view.dart';

import 'feature/navigation/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tochki',
      home: const MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainScreenController());

    final appBarTabs = [
      AppBarItem(item: AppBarTab(title: 'Точки', onTap: () => controller.changeTab(0))),
      AppBarItem(item: AppBarTab(title: 'Рецензии', onTap: () => controller.changeTab(1))),
      AppBarItem(item: AppBarTab(title: 'Временное', onTap: () => controller.changeTab(2))),
      AppBarItem(item: AppBarTab(title: 'Профиль', onTap: () => controller.changeTab(3))),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          height: kToolbarHeight - 10,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: appBarTabs.length,
            itemBuilder: (context, index) {
              return appBarTabs[index];
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 24,);
            },
          ),
        ),
      ),
      body: Obx(() {
        return IndexedStack(
          index: controller.tabIndex.value,
          children: const [
            MapView(),
            Center(child: Text('Рецензии')),
            Center(child: Text('Временное')),
            Center(child: Text('Профиль')),
          ],
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:tochki/models/appbar_tabs.dart';
import 'package:tochki/widgets/appbar_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarTabs = [
      AppBarItem(item: AppBarTab(title: 'Точки', onTap: (){})),
      AppBarItem(item: AppBarTab(title: 'Рецензии', onTap: (){})),
      AppBarItem(item: AppBarTab(title: 'Временное', onTap: (){})),
      AppBarItem(item: AppBarTab(title: 'Профиль', onTap: (){})),
    ];

    return MaterialApp(
      title: 'Tochki',
      home: Scaffold(
        extendBodyBehindAppBar: true, // Позволяет контенту (карте) заходить под AppBar
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Прозрачный фон
          elevation: 0, // Убираем тень
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
        body: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(54.989221, 73.368456),
            initialZoom: 15,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            CurrentLocationLayer(),
          ],
        ),
      ),
    );
  }
}

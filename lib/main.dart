import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tochki',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffFF5600),
            title: Text("Tochki"),
          ),
          body: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(54.989221, 73.368456),
              // Center the map over London
              initialZoom: 15,
            ),
            children: [
              TileLayer( // Display map tiles from any source
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                // OSMF's Tile Server
                userAgentPackageName: 'com.example.app',
                // And many more recommended properties!
              ),
              RichAttributionWidget( // Include a stylish prebuilt attribution widget that meets all requirments
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                  ),
                  // Also add images...
                ],
              ),
            ],
          ),
      ),
    );
  }
}
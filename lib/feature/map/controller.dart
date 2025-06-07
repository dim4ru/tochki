import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:latlong2/latlong.dart';

import '../marker/view.dart';

class MapController extends GetxController {
  // Контроллер карты из flutter_map
  final fmController = fm.MapController();
  var markers = <fm.Marker>[].obs;
  final supabase = Supabase.instance.client;

  /// Вызывается из виджета, когда bounds изменились
  void onMapMoved(fm.LatLngBounds bounds) {
    _fetchPlacesInBounds(bounds);
  }

  /// Запрашивает из Supabase точки внутри bounds
  Future<void> _fetchPlacesInBounds(fm.LatLngBounds b) async {
    final sw = b.southWest;
    final ne = b.northEast;

    final response = await supabase
        .from('places')
        .select('id, latitude, longitude, name')
        .gte('latitude',  sw.latitude)   // latitude >= юг
        .lte('latitude',  ne.latitude)   // latitude <= север
        .gte('longitude', sw.longitude)  // longitude >= запад
        .lte('longitude', ne.longitude)  // longitude <= восток
        .order('id');

    final List data = response as List<dynamic>;

    final newMarkers = data.map<fm.Marker>((e) {
      // 1) читаем координаты
      final lat = (e['latitude'] as num).toDouble();
      final lng = (e['longitude'] as num).toDouble();
      // 2) читаем id и текст
      final id = e['id'] as int;
      final text = e['name'] as String? ?? '';

      return PermanentMarker(
        point: LatLng(lat, lng),
        markerId: id,
        text: text,
      );
    }).toList();

    markers.value = newMarkers;
  }
}
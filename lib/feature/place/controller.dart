import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlaceDTO {
  final int id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;

  PlaceDTO({required this.id, required this.name, required this.description, required this.latitude, required this.longitude});

  @override
  String toString() => 'PlaceDTO(id: $id, name: $name, description: $description, latitude: $latitude, longitude: $longitude)';
}
 // table structure is INSERT INTO "public"."places" ("id", "name", "description", "author_id", "created_at", "rating", "visitor_count", "latitude", "longitude", "reviews_count") VALUES ('1', 'Дом Печокас 1911г.', '', '1', '2025-02-20 16:03:27.882983+00', null, '0', '54.993509', '73.365211', '0'), ('7', 'Самое старое здание Омска', 'Гаупвахта', '1', '2025-02-20 16:13:57.721986+00', null, '0', '54.985281', '73.368442', '0');
class PlaceController extends GetxController {
  final int placeId;
  final Rxn<PlaceDTO> place = Rxn<PlaceDTO>();

  PlaceController({required this.placeId});

  @override
  void onInit() async {
    super.onInit();
    final placeData = await Supabase.instance.client
        .from('places').select()
        .eq('id', placeId);
    for (var item in placeData) {
      place.value = PlaceDTO(
          id: item['id'],
          name: item['name'],
          description: item['description'],
          latitude: item['latitude'],
          longitude: item['longitude']
      );
    }
  }
}


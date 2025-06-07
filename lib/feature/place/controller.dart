import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/dto/place_dto.dart';

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
    for (var row in placeData) {
      place.value = PlaceDTO(
          id: row['id'],
          name: row['name'],
          description: row['description'],
          latitude: row['latitude'],
          longitude: row['longitude']
      );
    }
  }
}


import 'dart:developer';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/dto/place_dto.dart';

class PlaceController extends GetxController {
  final int placeId;
  final RxBool isVisited = false.obs;
  final Rxn<PlaceDTO> place = Rxn<PlaceDTO>();

  PlaceController({required this.placeId});

  @override
  void onInit() async {
    super.onInit();
    _fetchPlace();
  }

  void registerVisit() async {
    await Supabase.instance.client
        .from('visits').insert({'place_id': placeId, 'user_id': 1337});
    isVisited.value = true;
  }

  void _fetchPlace() async {
    final placeData = await Supabase.instance.client
        .from('places').select()
        .eq('id', placeId);

    final visitsData = await Supabase.instance.client
        .from('visits').select()
        .eq('place_id', placeId)
        .eq('user_id', 1337);

    final reviewData = await Supabase.instance.client
        .from('reviews').select()
        .eq('place_id', placeId);

    log("Place data: $placeData");
    log("Visits data: $visitsData");
    log("Review data: $reviewData");

    for (var row in placeData) {
      place.value = PlaceDTO(
        id: row['id'],
        name: row['name'],
        description: row['description'],
        latitude: row['latitude'],
        longitude: row['longitude'],
        rating: row['rating'],
        visitorCount: visitsData.length,
        reviewsCount: reviewData.length,
      );
    }
  }
}




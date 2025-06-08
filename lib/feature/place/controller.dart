import 'dart:developer';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/dto/place_dto.dart';
import '../authorization/controller.dart';

class PlaceController extends GetxController {
  final isLoading = true.obs;
  final isError = false.obs;

  final int placeId;
  final RxBool isVisited = false.obs;
  final Rxn<PlaceDTO> place = Rxn<PlaceDTO>();

  PlaceController({required this.placeId});

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    _fetchPlace();
    isLoading.value = false;
  }

  void registerVisit() async {
    await Supabase.instance.client
        .from('visits').insert({'place_id': placeId, 'user_id': Get.find<AuthController>().user?.id});
    isVisited.value = true;
  }

  void _fetchPlace() async {
    final auth = Get.find<AuthController>();

    final placeData = await Supabase.instance.client
        .from('places').select()
        .eq('id', placeId);

    final visitsData = auth.user == null ? [] : await Supabase.instance.client
        .from('visits').select()
        .eq('place_id', placeId)
        .eq('user_id', auth.user!.id);

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
        authorName: await auth.getUsernameById(row['author_id']),
        createdAt: row['created_at'] != null
            ? DateTime.parse(row['created_at'] as String)
            : null,
        visitorCount: visitsData.length,
        reviewsCount: reviewData.length,
      );
    }

    await Supabase.instance.client
        .from('visits').select()
        .eq('place_id', placeId)
        .eq('user_id', auth.user!.id)
        .then((value) => isVisited.value = value.isNotEmpty);
  }
}




import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/dto/review_dto.dart';

class ReviewsListController extends GetxController {
  final int placeId;
  ReviewsListController({required this.placeId}){
    _fetchReviews();
  }

  final RxList<ReviewDTO> reviews = <ReviewDTO>[].obs;

  Future<void> _fetchReviews() async {
    final response = await Supabase.instance.client
        .from('reviews')
        .select()
        .eq('place_id', placeId);
    final data = response as List<dynamic>;
    reviews.assignAll(data.map((e) => ReviewDTO.fromMap(e)).toList());
  }
}
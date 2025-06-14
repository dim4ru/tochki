// import 'dart:developer';
//
// import 'package:get/get.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:tochki/core/dto/review_dto.dart';
//
//
// class ReviewController extends GetxController {
//   final int reviewId;
//   final Rxn<ReviewDTO> review = Rxn<ReviewDTO>();
//
//   final Rxn<String> correspondingPlaceName = Rxn<String>();
//   final Rxn<int> reviewRating = Rxn<int>();
//   final Rxn<String> authorName = Rxn<String>();
//
//   ReviewController({required this.reviewId});
//
//   @override
//   void onInit() async {
//     super.onInit();
//     final reviewData = await Supabase.instance.client
//         .from('reviews')
//         .select()
//         .eq('id', reviewId);
//
//     log("Review data: $reviewData");
//     for (var row in reviewData) {
//       review.value = ReviewDTO(
//           id: row['id'],
//           createdAt: row['createdAt'],
//           title: row['title'],
//           body: row['body'],
//           placeId: row['placeId'],
//           authorId: row['authorId'],
//       );
//     }
//   }
// }
//

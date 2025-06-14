// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:tochki/shared/ui_kit/spacers.dart';
// import 'package:ui_kit/ui_kit.dart';
//
// import '../../review/view.dart';
//
// class PlaceStatsRow extends StatelessWidget {
//   final double? rating;
//   final int visited;
//   final int reviewsCount;
//
//   const PlaceStatsRow({
//     super.key,
//     required this.rating,
//     required this.visited,
//     required this.reviewsCount,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: TSpacers.spacing9,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // UiButton.text(
//           //   onPressed: (){},
//           //   label: rating != null
//           //       ? Text("${rating!.toStringAsFixed(0)}%")
//           //       : const Text("- %"),
//           //   icon: const Icon(Icons.thumbs_up_down_outlined),
//           // ),
//           UiButton.text(onPressed: (){}, label: Text(visited.toString()), icon: Icon(CupertinoIcons.person_2),),
//           UiButton.text(onPressed: (){Get.to(() => Review());}, label: Text('Рецензии ($reviewsCount)  ❯', style: TextStyle(fontWeight: FontWeight.bold)), icon: Icon(Icons.rate_review_outlined),),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:tochki/shared/spacers.dart';
import 'package:ui_kit/ui_kit.dart';

class PlaceStatsRow extends StatelessWidget {
  final double rating;
  final int visited;
  final String author;
  final int reviewsCount;

  const PlaceStatsRow({
    super.key,
    required this.rating,
    required this.visited,
    required this.author,
    required this.reviewsCount,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TSpacers.spacing9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UiButton.text(onPressed: (){}, label: Text("${rating.toStringAsFixed(0)}%"), icon: Icon(Icons.thumbs_up_down_outlined),),
          UiButton.text(onPressed: (){}, label: Text(visited.toString()), icon: Icon(Icons.pin_drop_outlined),),
          UiButton.text(onPressed: (){}, label: Text('Рецензии ($reviewsCount)  ❯', style: TextStyle(fontWeight: FontWeight.bold)), icon: Icon(Icons.rate_review_outlined),),
        ],
      ),
    );
  }
}

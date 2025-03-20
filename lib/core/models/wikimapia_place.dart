import 'package:json_annotation/json_annotation.dart';

part 'wikimapia_place.g.dart';

@JsonSerializable()
class WikimapiaPlace {
  final int id;
  final String title;
  final String description;
  final double latitude;
  final double longitude;

  WikimapiaPlace({
    required this.id,
    required this.title,
    required this.description,
    required this.latitude,
    required this.longitude,
  });

  factory WikimapiaPlace.fromJson(Map<String, dynamic> json) => _$WikimapiaPlaceFromJson(json);
  Map<String, dynamic> toJson() => _$WikimapiaPlaceToJson(this);
}

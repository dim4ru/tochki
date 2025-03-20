import 'package:json_annotation/json_annotation.dart';

part 'wikimapia_place.g.dart';

@JsonSerializable()
class WikimapiaPlace {
  final int id;
  final String title;
  final String description;
  final String url;
  final double lat;
  final double lon;

  WikimapiaPlace({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.lat,
    required this.lon,
  });

  factory WikimapiaPlace.fromJson(Map<String, dynamic> json) => _$WikimapiaPlaceFromJson(json);
  Map<String, dynamic> toJson() => _$WikimapiaPlaceToJson(this);
}

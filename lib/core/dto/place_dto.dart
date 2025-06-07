class PlaceDTO {
  final int id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final int? rating;
  final int visitorCount;
  final int reviewsCount;
  final DateTime? createdAt;

  PlaceDTO(
      {required this.id,
      required this.name,
      required this.description,
      required this.latitude,
      required this.longitude,
      required this.rating,
      required this.visitorCount,
      required this.reviewsCount,
      this.createdAt});

  @override
  String toString() =>
      'PlaceDTO(id: $id, name: $name, description: $description, latitude: $latitude, longitude: $longitude, rating: $rating, visitor_count $visitorCount, reviews_count $reviewsCount, createdAt: $createdAt)';
}
// table structure is INSERT INTO "public"."places" ("id", "name", "description", "author_id", "created_at", "rating", "visitor_count", "latitude", "longitude", "reviews_count") VALUES ('1', 'Дом Печокас 1911г.', '', '1', '2025-02-20 16:03:27.882983+00', null, '0', '54.993509', '73.365211', '0'), ('7', 'Самое старое здание Омска', 'Гаупвахта', '1', '2025-02-20 16:13:57.721986+00', null, '0', '54.985281', '73.368442', '0');

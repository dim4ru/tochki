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
  final String authorId;
  final String? authorName;

  PlaceDTO(
      {required this.id,
      required this.name,
      required this.description,
      required this.latitude,
      required this.longitude,
      required this.rating,
      required this.visitorCount,
      required this.reviewsCount,
      required this.createdAt,
      required this.authorId,
      required this.authorName
      });

  @override
  String toString() =>
      'PlaceDTO(id: $id, name: $name, description: $description, latitude: $latitude, longitude: $longitude, rating: $rating, visitor_count $visitorCount, reviews_count $reviewsCount, createdAt: $createdAt, authorName: $authorName, authorId: $authorId)';

  factory PlaceDTO.fromMap(Map<String, dynamic> map) {
    // Helper to parse an int that might come back as String
    int parseInt(dynamic v) =>
        v is int ? v : int.parse(v as String);

    // Helper to parse a double that might come back as String
    double parseDouble(dynamic v) =>
        v is double ? v : double.parse(v as String);

    return PlaceDTO(
      id:            parseInt(map['id']),
      name:          map['name'] as String,
      description:   (map['description'] as String?) ?? '',
      latitude:      parseDouble(map['latitude']),
      longitude:     parseDouble(map['longitude']),
      rating: map['rating'] != null
          ? parseInt(map['rating'])
          : null,
      visitorCount:  parseInt(map['visitor_count']),
      reviewsCount:  parseInt(map['reviews_count']),
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'] as String)
          : null,
      authorId:      map['author_id'] as String,
      authorName:    map['author_name'] as String?,
    );
  }
}
// table structure is INSERT INTO "public"."places" ("id", "name", "description", "author_id", "created_at", "rating", "visitor_count", "latitude", "longitude", "reviews_count") VALUES ('1', 'Дом Печокас 1911г.', '', '1', '2025-02-20 16:03:27.882983+00', null, '0', '54.993509', '73.365211', '0'), ('7', 'Самое старое здание Омска', 'Гаупвахта', '1', '2025-02-20 16:13:57.721986+00', null, '0', '54.985281', '73.368442', '0');

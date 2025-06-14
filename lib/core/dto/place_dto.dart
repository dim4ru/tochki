class PlaceDTO {
  final int id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final DateTime? createdAt;
  final String authorId;

  PlaceDTO(
      {required this.id,
      required this.name,
      required this.description,
      required this.latitude,
      required this.longitude,
      required this.createdAt,
      required this.authorId,
      });

  @override
  String toString() =>
      'PlaceDTO(id: $id, name: $name, description: $description, latitude: $latitude, longitude: $longitude, createdAt: $createdAt, authorId: $authorId)';

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
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'] as String)
          : null,
      authorId:      map['author_id'] as String,
    );
  }
}
// table structure is INSERT INTO "public"."places" ("id", "name", "description", "author_id", "created_at", "rating", "visitor_count", "latitude", "longitude", "reviews_count") VALUES ('1', 'Дом Печокас 1911г.', '', '1', '2025-02-20 16:03:27.882983+00', null, '0', '54.993509', '73.365211', '0'), ('7', 'Самое старое здание Омска', 'Гаупвахта', '1', '2025-02-20 16:13:57.721986+00', null, '0', '54.985281', '73.368442', '0');

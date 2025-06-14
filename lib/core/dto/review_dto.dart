class ReviewDTO {
  final int id;
  final DateTime createdAt;
  final String title;
  final String body;
  final int placeId;
  final String authorId;

  ReviewDTO({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.body,
    required this.placeId,
    required this.authorId,
  });

  @override
  String toString() =>
      'ReviewDTO(id: $id, createdAt: $createdAt, title: $title, body: $body, placeId: $placeId, authorId: $authorId)';

  factory ReviewDTO.fromMap(Map<String, dynamic> map) {
    int parseInt(dynamic v) => v is int ? v : int.parse(v as String);

    return ReviewDTO(
      id: parseInt(map['id']),
      createdAt: DateTime.parse(map['created_at'] as String),
      title: map['title'] as String,
      body: (map['body'] as String?) ?? '',
      placeId: parseInt(map['place_id']),
      authorId: map['author_id'] != null ? map['author_id'].toString() : '',
    );
  }
}

class ReviewDTO {
  final int id;
  final DateTime createdAt;
  final String title;
  final String body;
  final int placeId;
  final int authorId;

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
}

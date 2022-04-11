class AlbumRes {
  final int userId;
  final int id;
  final String title;

  const AlbumRes({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumRes.fromJson(Map<String, dynamic> json) {
    return AlbumRes(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}


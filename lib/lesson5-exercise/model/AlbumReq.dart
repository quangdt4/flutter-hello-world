class AlbumReq {
  final int id;
  final String title;

  const AlbumReq({required this.id, required this.title});

  factory AlbumReq.fromJson(Map<String, dynamic> json) {
    return AlbumReq(
      id: json['id'],
      title: json['title'],
    );
  }
}
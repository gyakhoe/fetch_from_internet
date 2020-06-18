import 'dart:convert';

class AlbumDetail {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  AlbumDetail({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  static AlbumDetail fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AlbumDetail(
      albumId: map['albumId'],
      id: map['id'],
      title: map['title'],
      url: map['url'],
      thumbnailUrl: map['thumbnailUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  static AlbumDetail fromJson(String source) => fromMap(json.decode(source));
}

import 'dart:convert';

class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  static Comment fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Comment(
      postId: map['postId'],
      id: map['id'],
      name: map['name'],
      email: map['email'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  static Comment fromJson(String source) => fromMap(json.decode(source));
}

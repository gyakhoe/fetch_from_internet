import 'dart:convert';

import 'package:flutter/foundation.dart';

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    @required this.userId,
    @required this.id,
    @required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
    };
  }

  static Album fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Album(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  static Album fromJson(String source) => fromMap(json.decode(source));
}

import 'dart:convert';

import 'package:fetch_from_internet/post_detail/data/models/post.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class PostRepository {
  static Future<List<Post>> fetchAllPost() async {
    final response =
        await http.get('http://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      List<Post> listOfPost = (json.decode(response.body) as List)
          .map((mapResponse) => Post.fromMap(mapResponse))
          .toList();
      return listOfPost;
    } else {
      throw Exception('Failed to load post details');
    }
  }

  static Future<List<Post>> fetchAllPostOfUser({@required int userId}) async {
    final response = await http
        .get('http://jsonplaceholder.typicode.com/posts?userId=$userId');
    if (response.statusCode == 200) {
      List<Post> listOfPost = (json.decode(response.body) as List)
          .map((mapResponse) => Post.fromMap(mapResponse))
          .toList();
      return listOfPost;
    } else {
      throw Exception('Failed to load post details');
    }
  }
}

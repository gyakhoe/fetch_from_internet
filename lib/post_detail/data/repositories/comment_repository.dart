import 'dart:convert';

import 'package:fetch_from_internet/post_detail/data/models/comment.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CommentRepository {
  static Future<List<Comment>> fetchAllComments() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/comments');
    if (response.statusCode == 200) {
      List<Comment> listOfComment = (json.decode(response.body) as List)
          .map((responseMap) => Comment.fromMap(responseMap))
          .toList();
      return listOfComment;
    } else {
      throw Exception('Unable to fetch comments.');
    }
  }

  static Future<List<Comment>> fetchAllCommentForPost(
      {@required int postId}) async {
    final response = await http
        .get('https://jsonplaceholder.typicode.com/comments?postId=$postId');

    if (response.statusCode == 200) {
      List<Comment> listOfComment = (json.decode(response.body) as List)
          .map((responseMap) => Comment.fromMap(responseMap))
          .toList();
      return listOfComment;
    } else {
      throw Exception('Unable to fetch comments.');
    }
  }

  static Future<int> fetchCommentCountForPost({@required int postId}) async {
    final response = await http
        .get('https://jsonplaceholder.typicode.com/comments?postId=$postId');

    if (response.statusCode == 200) {
      var listOfComment = (json.decode(response.body) as List);
      return listOfComment.length;
    } else {
      throw Exception('Unable to fetch comments.');
    }
  }
}

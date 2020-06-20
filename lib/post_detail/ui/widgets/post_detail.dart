import 'package:fetch_from_internet/post_detail/data/models/post.dart';
import 'package:fetch_from_internet/post_detail/ui/widgets/post_expansion_tile.dart';
import 'package:flutter/material.dart';

Widget postDetail({
  @required Future<List<Post>> futureListOfPost,
}) {
  return FutureBuilder(
    future: futureListOfPost,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return _postList(snapshot);
      } else if (snapshot.hasError) {
        return Text('Error occured while fetching post.');
      } else {
        return CircularProgressIndicator();
      }
    },
  );
}

Widget _postList(AsyncSnapshot snapshot) {
  List<Post> listOfPost = snapshot.data;
  return ListView.builder(
    itemCount: listOfPost.length,
    itemBuilder: (context, index) {
      Post post = listOfPost.elementAt(index);
      return postExpansionTile(context: context, post: post);
    },
  );
}

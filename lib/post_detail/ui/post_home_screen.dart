import 'package:fetch_from_internet/post_detail/data/models/post.dart';
import 'package:fetch_from_internet/post_detail/data/repositories/comment_repository.dart';
import 'package:fetch_from_internet/post_detail/data/repositories/post_repository.dart';
import 'package:fetch_from_internet/post_detail/logic/post_screen_logic.dart';
import 'package:fetch_from_internet/post_detail/ui/post_comment_screen.dart';
import 'package:fetch_from_internet/post_detail/ui/user_post_screen.dart';
import 'package:fetch_from_internet/post_detail/ui/widgets/post_expansion_tile.dart';
import 'package:flutter/material.dart';

class PostHomeScreen extends StatelessWidget {
  PostHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: FutureBuilder(
        future: PostScreenLogic.fetchPostScreenDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('post has some data');
            List<Post> listOfPost = snapshot.data;
            return ListView.builder(
              itemCount: listOfPost.length,
              itemBuilder: (context, index) {
                Post post = listOfPost.elementAt(index);
                return postExpansionTile(context: context, post: post);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error occured while fetching post.'),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

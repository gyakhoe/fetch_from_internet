import 'package:fetch_from_internet/post_detail/data/models/post.dart';
import 'package:fetch_from_internet/post_detail/data/repositories/comment_repository.dart';
import 'package:fetch_from_internet/post_detail/data/repositories/post_repository.dart';
import 'package:fetch_from_internet/post_detail/ui/user_post_screen.dart';
import 'package:flutter/material.dart';

import '../post_comment_screen.dart';

Widget postExpansionTile({
  @required BuildContext context,
  @required Post post,
}) {
  return ExpansionTile(
    leading: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserPostScreen(
                futureListOfPost:
                    PostRepository.fetchAllPostOfUser(userId: post.userId),
                userId: post.userId,
              ),
            ));
      },
      child: CircleAvatar(
        child: Text(post.userId.toString()),
      ),
    ),
    title: Text(post.title),
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(post.body),
      ),
      FlatButton(
        child: Text('Comments'),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PostCommentScreen(
                        post: post,
                        futureListOfComment:
                            CommentRepository.fetchAllCommentForPost(
                                postId: post.id),
                      )));
        },
      ),
    ],
  );
}

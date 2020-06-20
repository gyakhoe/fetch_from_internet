import 'package:fetch_from_internet/post_detail/data/models/post.dart';
import 'package:fetch_from_internet/post_detail/data/repositories/post_repository.dart';
import 'package:fetch_from_internet/post_detail/ui/widgets/post_detail.dart';
import 'package:flutter/material.dart';

class UserPostScreen extends StatelessWidget {
  final Future<List<Post>> futureListOfPost;
  final int userId;
  const UserPostScreen({
    Key key,
    @required this.futureListOfPost,
    @required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user: $userId details'),
      ),
      body: Center(
        child: postDetail(
            futureListOfPost:
                PostRepository.fetchAllPostOfUser(userId: userId)),
      ),
    );
  }
}

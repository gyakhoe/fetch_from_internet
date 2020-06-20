import 'package:fetch_from_internet/post_detail/data/repositories/post_repository.dart';
import 'package:fetch_from_internet/post_detail/ui/widgets/post_detail.dart';
import 'package:flutter/material.dart';

class PostHomeScreen extends StatelessWidget {
  PostHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: Center(
        child: postDetail(futureListOfPost: PostRepository.fetchAllPost()),
      ),
    );
  }
}

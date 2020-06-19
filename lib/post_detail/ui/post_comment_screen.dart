import 'package:fetch_from_internet/post_detail/data/models/comment.dart';
import 'package:fetch_from_internet/post_detail/data/models/post.dart';
import 'package:flutter/material.dart';

class PostCommentScreen extends StatelessWidget {
  final Post post;
  final Future<List<Comment>> futureListOfComment;
  const PostCommentScreen(
      {Key key, @required this.post, @required this.futureListOfComment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ExpansionTile(
              leading: CircleAvatar(
                radius: 30,
                child: Text(post.userId.toString()),
              ),
              title: Text(post.title),
              children: <Widget>[
                Text(post.body),
              ],
            ),
            Center(
              child: FutureBuilder(
                future: futureListOfComment,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.hasError.toString());
                  } else if (snapshot.hasData) {
                    List<Comment> listOfComment = snapshot.data;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: listOfComment.length,
                        itemBuilder: (context, index) {
                          Comment comment = listOfComment.elementAt(index);
                          return ListTile(
                            title: Text(comment.email),
                            subtitle: Text(comment.body),
                          );
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

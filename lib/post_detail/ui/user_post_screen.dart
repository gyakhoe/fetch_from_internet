import 'package:fetch_from_internet/post_detail/data/models/post.dart';
import 'package:fetch_from_internet/post_detail/ui/widgets/post_expansion_tile.dart';
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
        child: FutureBuilder(
          future: futureListOfPost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Post> listOfPost = snapshot.data;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: listOfPost.length,
                  itemBuilder: (context, index) {
                    Post post = listOfPost.elementAt(index);

                    if (index == 0) {
                      return Column(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            color: Theme.of(context).primaryColor,
                            child: Center(
                              child: CircleAvatar(
                                radius: 50,
                                child: Text('$userId'),
                              ),
                            ),
                          ),
                          postExpansionTile(context: context, post: post),
                        ],
                      );
                    }

                    return postExpansionTile(context: context, post: post);
                  });
            } else if (snapshot.hasError) {
              return Text(
                  'Error occured while fetching detail for user ID : $userId');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

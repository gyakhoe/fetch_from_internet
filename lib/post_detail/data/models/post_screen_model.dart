import 'package:fetch_from_internet/post_detail/data/models/post.dart';

class PostScreenModel {
  final Post post;
  final int commentCount;

  PostScreenModel({
    this.post,
    this.commentCount,
  });
}

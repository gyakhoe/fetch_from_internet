import 'package:fetch_from_internet/post_detail/data/models/post.dart';
import 'package:fetch_from_internet/post_detail/data/repositories/post_repository.dart';

class PostScreenLogic {
  static Future<List<Post>> fetchPostScreenDetails() async {
    List<Post> listOfPost = await PostRepository.fetchAllPost();
    return listOfPost;
  }
}

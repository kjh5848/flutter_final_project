import 'package:dio/dio.dart';
import 'package:flutter_app_02/post.dart';

class PostRepository {
  Dio dio = Dio();

  Future<Post> findById(int id) async {
    // dio 통신 -> List, Map -> final
    // -> Response<Map<String, dynamic>>
    // -> Response<List<dynamic>>
    final response =
        await dio.get("https://jsonplaceholder.typicode.com/posts/${id}");

    final body = response.data!;
    Post post = Post.fromMap(body);

    return post;
  }
}

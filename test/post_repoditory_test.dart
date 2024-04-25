import 'package:flutter_app_02/post.dart';
import 'package:flutter_app_02/post_repository.dart';

void main() async {
  Post post = await PostRepository().findById(1);
  print(post.id);
  print(post.title);
  print(post.body);
  print(post.userId);

  Map<String, dynamic> changePost = post.toMap();
  print(changePost);
}

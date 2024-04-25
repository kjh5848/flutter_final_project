import 'package:flutter_app_02/post.dart';
import 'package:flutter_app_02/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터
class PostListModel {
  Post post;

  PostListModel(
    this.post,
  );
}

// 2. 창고
class PostListVM extends StateNotifier<PostListModel?> {
  PostListVM(super.state);

  void notifyInit() async {
    Post post = await PostRepository().findById(1);
    state = PostListModel(post);
  }

  void findById(int id) async {
    Post post = await PostRepository().findById(id);
    state = PostListModel(post);
  }
}

// 3. 창고 관리자
final postListProvider =
    StateNotifierProvider<PostListVM, PostListModel?>((ref) {
  PostListVM vm = PostListVM(null);
  vm.notifyInit();
  return vm;
});

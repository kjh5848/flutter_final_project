import 'package:flutter/material.dart';
import 'package:flutter_app_02/post.dart';
import 'package:flutter_app_02/post_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostPage extends ConsumerWidget {
  PostPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostListModel? model = ref.watch(postListProvider);

    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      Post post = model.post!;

      return Scaffold(
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network("https://picsum.photos/id/50/200/200",
                  fit: BoxFit.cover),
            ),
            Text(
                "id : ${post.id}, userId: ${post.userId}, title : ${post.title}"),
            ElevatedButton(
                onPressed: () {
                  ref.read(postListProvider.notifier).findById(2);
                },
                child: Text("값변경")),
          ],
        ),
      );
    }
  }
}

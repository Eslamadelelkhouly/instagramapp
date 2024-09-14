import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/function/firebase/firestore.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/fotter_post.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/row_title_home_screen.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.postMap,
  });
  final Map<String, dynamic> postMap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowTitleHomeScreen(
          postmap: postMap,
        ),
        Image.network(
          postMap['imagepost'],
        ),
        FotterPost(
          postmap: postMap,
          onPressediconfavorite: () {
            Firestore().addPost(postmap: postMap);
          },
        ),
      ],
    );
  }
}

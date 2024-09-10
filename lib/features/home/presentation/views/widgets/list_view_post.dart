import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/post.dart';

class ListViewPost extends StatelessWidget {
  const ListViewPost({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return const Post();
      },
    );
  }
}

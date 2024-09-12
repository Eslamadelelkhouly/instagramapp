import 'package:flutter/material.dart';
import 'package:instagramapp/features/comment/presentation/views/widgets/comment_view_body.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key, required this.postid});
  final String postid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CommentViewBody(
        postid: postid,
      ),
    );
  }
}

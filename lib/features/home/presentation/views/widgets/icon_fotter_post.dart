import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/features/comment/presentation/views/comment_screen.dart';

class IconFotterPost extends StatelessWidget {
  const IconFotterPost({
    super.key,
    required this.onPressediconfavorite,
    required this.mappost,
  });

  final void Function()? onPressediconfavorite;
  final Map<String, dynamic> mappost;

  @override
  Widget build(BuildContext context) {
    // Check if the current user has liked the post
    final bool isLiked =
        mappost['likes'].contains(FirebaseAuth.instance.currentUser?.uid ?? '');

    return Row(
      children: [
        IconButton(
          onPressed: onPressediconfavorite,
          icon: Icon(
            Icons.favorite,
            color: isLiked ? Colors.red : Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.comment,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

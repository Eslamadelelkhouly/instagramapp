import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/features/comment/presentation/views/widgets/card_comment_screen.dart';
import 'package:instagramapp/features/home/data/models/user_model.dart';

class ListViewCardCommnt extends StatelessWidget {
  const ListViewCardCommnt({
    super.key,
    required this.userModel,
    required this.postid,
  });
  final UserModel userModel;
  final String postid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('posts')
          .doc(postid)
          .collection('comments')
          .snapshots(),
      builder: (context, snapshot) {
        // Handle loading and error states
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Error loading comments.'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No comments available.'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Map<String, dynamic> commentMap =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;

            return CardCommentScreen(
              commentMap: commentMap,
            );
          },
        );
      },
    );
  }
}

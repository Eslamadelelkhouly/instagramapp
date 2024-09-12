import 'package:flutter/material.dart';
import 'package:instagramapp/features/comment/presentation/views/widgets/card_comment_screen.dart';
import 'package:instagramapp/features/home/data/models/user_model.dart';

class ListViewCardCommnt extends StatelessWidget {
  const ListViewCardCommnt({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const CardCommentScreen();
      },
    );
  }
}

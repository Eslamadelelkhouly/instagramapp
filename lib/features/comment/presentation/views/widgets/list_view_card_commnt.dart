import 'package:flutter/material.dart';
import 'package:instagramapp/features/comment/presentation/views/widgets/card_comment_screen.dart';

class ListViewCardCommnt extends StatelessWidget {
  const ListViewCardCommnt({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CardCommentScreen();
      },
    );
  }
}

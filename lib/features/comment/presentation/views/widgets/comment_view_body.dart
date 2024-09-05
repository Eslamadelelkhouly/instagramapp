import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/border.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/comment/presentation/views/widgets/card_comment_screen.dart';
import 'package:instagramapp/features/comment/presentation/views/widgets/list_view_card_commnt.dart';

class CommentViewBody extends StatelessWidget {
  const CommentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Text(
              'Comment',
              style: Style.textStyle30,
            ),
            ListViewCardCommnt(),
          ],
        ),
      ),
    );
  }
}

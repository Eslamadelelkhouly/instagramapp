import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/comment/presentation/views/comment_screen.dart';

class TextFotter extends StatelessWidget {
  const TextFotter({
    super.key,
    required this.postmap,
  });
  final Map<String, dynamic> postmap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${postmap['likes'].length} likes',
          style: Style.textStyle15.copyWith(
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 2),
          child: Text(
            'nice photo today',
            style: Style.textStyle15.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const CommentScreen();
            }));
          },
          child: Text(
            'Add comment',
            style: Style.textStyle15.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

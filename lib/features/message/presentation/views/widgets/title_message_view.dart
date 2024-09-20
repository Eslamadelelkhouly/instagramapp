import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class TitleMessageView extends StatelessWidget {
  const TitleMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 15),
        Text(
          'Chats',
          style: Style.textStyle30,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class TitleScreenAdd extends StatelessWidget {
  const TitleScreenAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.cancel, color: Colors.white),
        ),
        Text(
          'New Post',
          style: Style.textStyle20,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Next',
            style: Style.textStyle15,
          ),
        ),
      ],
    );
  }
}

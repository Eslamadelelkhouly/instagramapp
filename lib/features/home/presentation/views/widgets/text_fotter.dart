import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class TextFotter extends StatelessWidget {
  const TextFotter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '280 likes',
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
          onPressed: () {},
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

import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class TitleScreenAdd extends StatelessWidget {
  const TitleScreenAdd({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.cancel, color: Colors.white),
        ),
        const Text(
          'New Post',
          style: Style.textStyle20,
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'Next',
            style: Style.textStyle15,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class TitleScreenAdd extends StatelessWidget {
  const TitleScreenAdd({
    super.key,
    this.onPressednext,
    this.onPressedcancel,
  });
  final void Function()? onPressednext;
  final void Function()? onPressedcancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onPressedcancel,
          icon: const Icon(Icons.cancel, color: Colors.white),
        ),
        const Text(
          'New Post',
          style: Style.textStyle20,
        ),
        TextButton(
          onPressed: onPressednext,
          child: const Text(
            'Next',
            style: Style.textStyle15,
          ),
        ),
      ],
    );
  }
}

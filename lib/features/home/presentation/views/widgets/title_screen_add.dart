import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class TitleScreenAdd extends StatelessWidget {
  const TitleScreenAdd({
    super.key,
    this.onPressednext,
    this.onPressedcancel,
    required this.tilte,
  });
  final void Function()? onPressednext;
  final void Function()? onPressedcancel;
  final String tilte;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onPressedcancel,
          icon: const Icon(Icons.cancel, color: Colors.white),
        ),
        Text(
          tilte,
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

import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: Style.textStyle15,
      ),
    );
  }
}

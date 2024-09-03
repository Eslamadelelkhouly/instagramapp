import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: Style.textStyle20,
          ),
        ),
      ),
    );
  }
}

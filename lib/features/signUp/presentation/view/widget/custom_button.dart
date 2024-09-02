import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});

  final String text;
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
          onPressed: () {},
          child: Text(
            text,
            style: Style.textStyle20,
          ),
        ),
      ),
    );
  }
}

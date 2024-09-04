import 'package:flutter/material.dart';

class IconFotterPost extends StatelessWidget {
  const IconFotterPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            )),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.comment,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CirclePhoto extends StatelessWidget {
  const CirclePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: NetworkImage(
        'https://cdn.pixabay.com/photo/2018/11/13/22/01/instagram-3814080_1280.png',
      ),
    );
  }
}

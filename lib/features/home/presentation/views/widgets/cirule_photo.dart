import 'package:flutter/material.dart';

class CirclePhoto extends StatelessWidget {
  const CirclePhoto({super.key, required this.radius});

  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(
        'https://cdn.pixabay.com/photo/2018/11/13/22/01/instagram-3814080_1280.png',
      ),
    );
  }
}

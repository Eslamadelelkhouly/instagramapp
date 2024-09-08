import 'package:flutter/material.dart';

class CirclePhoto extends StatelessWidget {
  const CirclePhoto({super.key, required this.radius, required this.image});

  final double radius;
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(
        image,
      ),
    );
  }
}

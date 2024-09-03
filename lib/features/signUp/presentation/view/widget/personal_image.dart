import 'package:flutter/material.dart';

class PersonalImage extends StatelessWidget {
  const PersonalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 80,
          backgroundColor: Colors.white,
        ),
        Positioned(
          height: 80 * 2,
          width: 80 * 2,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              size: 20,
              Icons.add,
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}

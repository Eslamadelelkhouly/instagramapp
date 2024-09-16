import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class PhotoCurrentProfile extends StatelessWidget {
  const PhotoCurrentProfile({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CirclePhoto(
          radius: 40,
          image: image,
        ),
        Positioned(
          width: 140,
          height: 130,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

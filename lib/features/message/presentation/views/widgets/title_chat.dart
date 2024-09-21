import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class TitleChat extends StatelessWidget {
  const TitleChat({super.key, required this.name, required this.image});
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        CirclePhoto(
          radius: 20,
          image: image,
        ),
        const SizedBox(width: 3),
        Text(
          name,
          style: Style.textStyle20,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class PersonalView extends StatelessWidget {
  const PersonalView({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CirclePhoto(
          image: image,
          radius: 40,
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: Style.textStyle20,
        ),
      ],
    );
  }
}

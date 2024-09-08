import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class PersonalView extends StatelessWidget {
  const PersonalView({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CirclePhoto(
          image: image,
          radius: 40,
        ),
        const SizedBox(height: 10),
        const Text(
          'Name',
          style: Style.textStyle20,
        ),
      ],
    );
  }
}

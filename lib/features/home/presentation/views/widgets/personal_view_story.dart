import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/photo_current_profile.dart';

class PersonalViewStory extends StatelessWidget {
  const PersonalViewStory({super.key, required this.name, required this.image});
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        PhotoCurrentProfile(image: image),
        const SizedBox(height: 10),
        Text(
          name,
          style: Style.textStyle20,
        ),
      ],
    );
    ;
  }
}

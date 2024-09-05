import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class PersonalView extends StatelessWidget {
  const PersonalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CirclePhoto(
          radius: 40,
        ),
        SizedBox(height: 10),
        Text(
          'Name',
          style: Style.textStyle20,
        ),
      ],
    );
  }
}

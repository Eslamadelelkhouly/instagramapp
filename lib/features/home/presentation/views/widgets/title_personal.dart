import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/details_personal.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/personal_view.dart';

class TitlePersonal extends StatelessWidget {
  const TitlePersonal({
    super.key,
    required this.personalimage,
    required this.name,
  });

  final String personalimage;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize
          .min, // Add this line to make Row take only the necessary space
      children: [
        Expanded(
          child: PersonalView(
            name: name,
            image: personalimage,
          ),
        ),
        const SizedBox(width: 10), // Add spacing if needed
        const Expanded(
          child: DetailsPersonal(),
        ),
      ],
    );
  }
}

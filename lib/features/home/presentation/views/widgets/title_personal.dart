import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/details_personal.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/personal_view.dart';

class TitlePersonal extends StatelessWidget {
  const TitlePersonal(
      {super.key, required this.personalimage, required this.name});
  final String personalimage;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PersonalView(
          name: name,
          image: personalimage,
        ),
        const DetailsPersonal(),
      ],
    );
  }
}

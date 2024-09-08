import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/details_personal.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/personal_view.dart';

class TitlePersonal extends StatelessWidget {
  const TitlePersonal({super.key, required this.personalimage});
  final String personalimage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PersonalView(
          image: personalimage,
        ),
        const DetailsPersonal(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/details_personal.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/personal_view.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/title_personal.dart';

class PersonalViewBody extends StatelessWidget {
  const PersonalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const TitlePersonal(),
          ],
        ),
      ),
    );
  }
}

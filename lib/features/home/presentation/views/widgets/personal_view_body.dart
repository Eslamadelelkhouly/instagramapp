import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/personal_view.dart';

class PersonalViewBody extends StatelessWidget {
  const PersonalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const SizedBox(width: 20),
            const PersonalView(),
          ],
        ),
      ),
    );
  }
}

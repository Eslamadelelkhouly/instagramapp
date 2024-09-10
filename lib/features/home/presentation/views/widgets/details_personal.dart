import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/card_daetails.dart';

class DetailsPersonal extends StatelessWidget {
  const DetailsPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 30),
        CardDaetails(
          number: '5',
          nameNumber: 'Posts',
        ),
        SizedBox(width: 10),
        CardDaetails(
          number: '5',
          nameNumber: 'Followers',
        ),
        SizedBox(width: 10),
        CardDaetails(
          number: '5',
          nameNumber: 'Following',
        ),
      ],
    );
  }
}

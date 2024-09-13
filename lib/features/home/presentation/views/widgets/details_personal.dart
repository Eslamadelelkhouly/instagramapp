import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/card_daetails.dart';

class DetailsPersonal extends StatelessWidget {
  const DetailsPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: CardDaetails(
            number: '5',
            nameNumber: 'Posts',
          ),
        ),
        const SizedBox(width: 10),
        CardDaetails(
          number: '5',
          nameNumber: 'Followers',
        ),
        const SizedBox(width: 10),
        CardDaetails(
          number: '5',
          nameNumber: 'Following',
        ),
      ],
    );
  }
}

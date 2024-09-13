import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class CardDaetails extends StatelessWidget {
  const CardDaetails(
      {super.key, required this.number, required this.nameNumber});

  final String number;
  final String nameNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: Style.textStyle15.copyWith(
            color: Colors.white,
          ),
        ),
        Text(
          nameNumber,
          style: Style.textStyle10.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text(
            'Instegram',
            style: Style.textStyle30,
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}

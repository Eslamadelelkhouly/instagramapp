import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';

class RowTitleHomeScreen extends StatelessWidget {
  const RowTitleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2018/11/13/22/01/instagram-3814080_1280.png',
            ),
          ),
          SizedBox(width: 10),
          Text(
            'name',
            style: Style.textStyle15.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

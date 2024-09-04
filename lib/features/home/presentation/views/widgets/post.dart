import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/row_title_home_screen.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RowTitleHomeScreen(),
        Image.network(
          'https://cdn.pixabay.com/photo/2018/11/13/22/01/instagram-3814080_1280.png',
        ),
      
      ],
    );
  }
}

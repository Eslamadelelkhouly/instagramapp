import 'package:flutter/material.dart';

class GridImages extends StatelessWidget {
  const GridImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        childAspectRatio: 2 / 2.25,
        crossAxisCount: 3,
        children: List.generate(5, (index) {
          return Image.network(
            'https://cdn.pixabay.com/photo/2018/11/13/22/01/instagram-3814080_1280.png',
          );
        }),
      ),
    );
  }
}

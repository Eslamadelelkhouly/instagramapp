import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class ListTielSearch extends StatelessWidget {
  const ListTielSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'name',
        style: Style.textStyle20,
      ),
      leading: CirclePhoto(
        image:
            'https://cdn.pixabay.com/photo/2018/11/13/22/01/instagram-3814080_1280.png',
        radius: 20,
      ),
    );
  }
}

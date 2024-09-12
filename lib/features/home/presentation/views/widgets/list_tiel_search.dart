import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/personal_view.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/personal_view_body.dart';

class ListTielSearch extends StatelessWidget {
  const ListTielSearch({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: Style.textStyle20,
      ),
      leading: CirclePhoto(
        image: image,
        radius: 20,
      ),
    );
  }
}

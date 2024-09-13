import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class ListTielSearch extends StatelessWidget {
  const ListTielSearch({
    super.key,
    required this.name,
    required this.image,
    this.onTap,
  });

  final String name;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(
          name,
          style: Style.textStyle20,
        ),
        leading: CirclePhoto(
          image: image,
          radius: 20,
        ),
      ),
    );
  }
}

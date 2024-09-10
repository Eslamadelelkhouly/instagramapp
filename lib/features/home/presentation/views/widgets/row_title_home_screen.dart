import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class RowTitleHomeScreen extends StatelessWidget {
  const RowTitleHomeScreen({
    super.key,
    required this.imageperson,
    required this.nameuser,
  });
  final String imageperson;
  final String nameuser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          CirclePhoto(
            image: imageperson,
            radius: 20,
          ),
          const SizedBox(width: 10),
          Text(
            nameuser,
            style: Style.textStyle15.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

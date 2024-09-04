import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class RowTitleHomeScreen extends StatelessWidget {
  const RowTitleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          const CirclePhoto(),
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

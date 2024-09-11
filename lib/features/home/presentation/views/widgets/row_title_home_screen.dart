import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/function/firebase/firestore.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class RowTitleHomeScreen extends StatelessWidget {
  const RowTitleHomeScreen({
    super.key,
    required this.postmap,
  });
  final Map<String, dynamic> postmap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          CirclePhoto(
            image: postmap['userimage'],
            radius: 20,
          ),
          const SizedBox(width: 10),
          Text(
            postmap['username'],
            style: Style.textStyle15.copyWith(
              color: Colors.white,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Firestore().delete_post(postmap: postmap);
            },
            icon: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}

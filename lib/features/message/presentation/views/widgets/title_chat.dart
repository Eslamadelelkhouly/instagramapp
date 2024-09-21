import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class TitleChat extends StatelessWidget {
  const TitleChat({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        CirclePhoto(
          radius: 20,
          image:
              'https://img.freepik.com/free-psd/instagram-application-logo_23-2151544096.jpg?w=740&t=st=1726850732~exp=1726851332~hmac=5b284cb58fd4b6842de0f82fffea5ed18d921f5b046164de4584301677e3a644',
        ),
        const SizedBox(width: 3),
        Text(
          'name',
          style: Style.textStyle20,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/cirule_photo.dart';

class CardListViewMessage extends StatelessWidget {
  const CardListViewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: PopupMenuButton<String>(
        icon: Icon(Icons.more_vert, color: Colors.white),
        onSelected: (String choice) {
          if (choice == 'option1') {
            // delete function
          } else if (choice == 'option2') {
            // block function
          }
        },
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'option1',
              child: Text(
                'delete',
              ),
            ),
            PopupMenuItem<String>(
              value: 'option2',
              child: Text(
                'block',
              ),
            ),
          ];
        },
      ),
      title: Text(
        'name',
        style: Style.textStyle20,
      ),
      subtitle: Text(
        'hello',
        style: Style.textStyle20.copyWith(color: Colors.grey),
      ),
      leading: CirclePhoto(
        radius: 25,
        image:
            'https://img.freepik.com/free-psd/instagram-application-logo_23-2151544096.jpg?w=740&t=st=1726850732~exp=1726851332~hmac=5b284cb58fd4b6842de0f82fffea5ed18d921f5b046164de4584301677e3a644',
      ),
    );
  }
}

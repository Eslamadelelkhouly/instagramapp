import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/story_view.dart';

class CardListViewStory extends StatelessWidget {
  const CardListViewStory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Story();
            },
          ),
        );
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.pink,
            width: 3,
          ),
          image: const DecorationImage(
            image: NetworkImage(
              'https://img.freepik.com/free-vector/instagram-icon_1057-2227.jpg?t=st=1726528908~exp=1726532508~hmac=7d981fa41479c3d33359ac6787850e82d23eb30e9a3c1ee586eb2bb920f72471&w=740',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

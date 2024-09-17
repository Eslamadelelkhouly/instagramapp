import 'package:flutter/material.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/card_list_view_story.dart';
class ListViewStory extends StatelessWidget {
  const ListViewStory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Give it a fixed height
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CardListViewStory(),
              ],
            ),
          );
        },
      ),
    );
  }
}

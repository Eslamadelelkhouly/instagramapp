import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/style.dart';
import 'package:instagramapp/features/home/function/firebase/firestore.dart';
import 'package:instagramapp/features/home/presentation/views/widgets/card_list_view_story.dart';

class ListViewStory extends StatelessWidget {
  const ListViewStory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Fixed height for the ListView
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('stories', isNotEqualTo: [])
            .where('followers',
                arrayContains: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while the data is loading
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            // If no data or empty data, show an empty message or widget
            return const Center(
              child: Text(
                'No stories available',
                style: Style.textStyle20,
              ),
            );
          }

          // Once data is available, build the ListView
          return ListView.builder(
            itemCount: snapshot.data!.docs.length, // Ensure itemCount is valid
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Map<String, dynamic> userMap =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              Firestore().deleteAfter24h(story: userMap['stories'][index]);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    CardListViewStory(
                      userMap: userMap,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

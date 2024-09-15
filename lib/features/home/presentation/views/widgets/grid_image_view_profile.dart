import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GridImageViewProfile extends StatelessWidget {
  const GridImageViewProfile({
    super.key,
    required this.uid,
  });
  final String uid;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('posts')
              .where('uid', isEqualTo: uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('');
            }
            return GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 2.2 / 2.70,
              crossAxisCount: 3,
              children: List.generate(snapshot.data!.docs.length, (index) {
                return Image.network(snapshot.data!.docs[index]['imagepost']);
              }),
            );
          }),
    );
  }
}

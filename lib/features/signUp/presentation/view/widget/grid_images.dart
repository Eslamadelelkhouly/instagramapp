import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class GridImages extends StatelessWidget {
  const GridImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('posts')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ModalProgressHUD(
                inAsyncCall: true,
                child: Text(''),
              );
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

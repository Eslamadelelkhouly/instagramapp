import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/card_list_view_message.dart';

class ListViewMessage extends StatelessWidget {
  const ListViewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .where('participation',
              arrayContains: FirebaseAuth.instance.currentUser!.uid)
          .orderBy('date', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Something went wrong: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.docs.isNotEmpty) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> chatMap =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              String currentid = FirebaseAuth.instance.currentUser!.uid;
              String name = currentid == chatMap['senderid']
                  ? chatMap['recivername']
                  : chatMap['sendername'];
              String image = currentid == chatMap['senderid']
                  ? chatMap['reciverimage']
                  : chatMap['senderimage'];
              String id = currentid == chatMap['senderid']
                  ? chatMap['reciverid']
                  : chatMap['senderid'];

              return CardListViewMessage(
                id: id,
                name: name,
                image: image,
              );
            },
          );
        }

        // If no messages are found
        return const Center(child: Text('No messages available'));
      },
    );
  }
}

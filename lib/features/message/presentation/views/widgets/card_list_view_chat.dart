import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/features/message/presentation/views/widgets/container_message.dart';
import 'package:intl/intl.dart';

class CardListViewChat extends StatelessWidget {
  const CardListViewChat({super.key, required this.id});
  final String id;
  String chatroomid() {
    List user = [FirebaseAuth.instance.currentUser!.uid, id];
    user.sort();
    print(user);
    return '${user[0]}_${user[1]}';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .doc(chatroomid())
            .collection('messages')
            .orderBy('date', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text('An error occurred: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            print('No data found for chat room ${chatroomid()}');
            return Center(child: Text('No messages yet'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> messageMap =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              print(messageMap);
              return Align(
                alignment: Alignment.centerLeft,
                child: ContainerMessage(
                  data: DateFormat.jm().format(messageMap['date'].toDate()),
                  message: messageMap['message'],
                ),
              );
            },
          );
        });
  }
}

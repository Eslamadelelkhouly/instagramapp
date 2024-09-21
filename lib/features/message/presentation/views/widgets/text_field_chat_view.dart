import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/core/utils/border.dart';
import 'package:instagramapp/features/home/presentation/manager/provider/provider_user.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class TextFieldChatView extends StatefulWidget {
  const TextFieldChatView({
    super.key,
    required this.name,
    required this.image,
    required this.id,
  });
  final String name;
  final String image;
  final String id;
  @override
  State<TextFieldChatView> createState() => _TextFieldChatViewState();
}

class _TextFieldChatViewState extends State<TextFieldChatView> {
  final controller = TextEditingController();

  String chatroomid() {
    List user = [FirebaseAuth.instance.currentUser!.uid, widget.id];
    user.sort();
    return '${user[0]}_${user[1]}';
  }

  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<ProviderUser>(context);
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Type here',
        enabledBorder: customborderenable(),
        focusedBorder: customborderfoucs(),
        suffixIcon: IconButton(
          onPressed: () async {
            if (controller.text != '') {
              final idmessage = Uuid().v4();
              await FirebaseFirestore.instance
                  .collection('chats')
                  .doc(chatroomid())
                  .set({
                'sendername': userprovider.getUser!.name,
                'senderimage': userprovider.getUser!.image,
                'senderid': userprovider.getUser!.uid,
                'recivername': widget.name,
                'reciverimage': widget.image,
                'reciverid': widget.id,
                'participation': [userprovider.getUser!.uid, widget.id],
                'chatroomid': chatroomid(),
                'date': Timestamp.now(),
              });
              await FirebaseFirestore.instance
                  .collection('chats')
                  .doc(chatroomid())
                  .collection('messages')
                  .doc(idmessage)
                  .set({
                'message': controller.text,
                'senderid': userprovider.getUser!.uid,
                'date': Timestamp.now(),
                'messageid': idmessage,
              });
            }
            setState(() {
              controller.text = '';
            });
          },
          icon: const Icon(Icons.send, color: Colors.white),
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.photo, color: Colors.white),
        ),
      ),
    );
  }
}
